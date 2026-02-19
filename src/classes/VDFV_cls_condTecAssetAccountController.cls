/************************************************************************************************************************************************************************************
 * @name             : VDFV_cls_condTecAssetAccountController.cls
 * @author           : Alfredo Muñiz Ortega - VASS
 * @description:     : Controlador del LWC -> vdfv_lwc_condicionesTecnicasAssetAccount
 * @testClass		: VDFV_cls_condTecAssetAccount_test.cls
 *
 * Changes (Version)
 * -------------------------------------
 *           No.     Date            Author                  Description
 *           -----   ----------      --------------------    ---------------
 * @version  1.0     31/10/19        Alfredo Muñiz Ortega    Controlador del LWC -> vdfv_lwc_condicionesTecnicasAssetAccount
 * @version  2.0     06/11/19        Alfredo Muñiz Ortega    Añadir comentarios
 * @version	3.0		13/11/2019		Alfredo Muñiz Ortega	Mejora de la clase (parametros, query y simplificación)
 *************************************************************************************************************************************************************************************/
public with sharing class VDFV_cls_condTecAssetAccountController {
	private static final String CLASS_NAME = VDFV_cls_condTecAssetAccountController.class.getName();
	private static final String QUERY = 'SELECT Id, Name, ';
	private static final String FROM_QUERY = ' FROM ';
	private static final String WHERE_QUERY = ' WHERE ';

	private static final String S_OBJECT = 'sObject';
	private static final String FIELD_SET = 'fieldSet';
	private static final String OBJ_API_NAME = 'objApiName';

	@TestVisible
	private static Boolean testException = false;

	/**
	 *  @name: CondTecAssetException
	 *  @version: 1.0
	 *  @creation date: 4/6/2025
	 *  @author: Jose Raimundo Montes - Unisys
	 *  @description: Para lanzar excepciones en la clase.
	 */
	public with sharing class CondTecAssetException extends Exception {
	}

	/**
	 * @name: fieldSetMethod
	 * @version: 1.0
	 * @creation date: 13/11/2019
	 * @author: Alfredo Muñiz Ortega
	 * @description: Metodo que recupera los datos
	 */
	@AuraEnabled(cacheable=true)
	public static Map<String, Object> fieldSetMethod(
		Id recordId,
		String fieldSetName,
		String relationShipName,
		String whereCondition
	) {
		String METHOD = 'fieldSetMethod';
		System.debug(CLASS_NAME + ' - ' + METHOD + ': INICIO');

		Map<String, Object> mapReturn = new Map<String, Object>();
		List<String> lstFieldSet = new List<String>();

		//Convertir fieldSetName (pasado por parametro) de String a FieldSet
		Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe();
		Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(relationShipName);
		Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();
		Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);

		//Guardar en una lista los campos del FieldSet
		List<Schema.FieldSetMember> fieldSetList = fieldSetObj.getFields();

		//Guardar en la lista, cada campo del FieldSet
		for (Schema.FieldSetMember f : fieldSetList) {
			lstFieldSet.add(f.getFieldPath());
		}

		try {
			if (Test.isRunningTest() && testException) {
				throw new CondTecAssetException();
			}
			//(Si se utiliza el "recordId" pasado por parámetro para comparar, se debe poner "=:recordId" en el WHERE de las properties)
			String escapedFields = String.escapeSingleQuotes(String.join(lstFieldSet, VDFV_cls_constantes.COMMA));
			String fromClause = FROM_QUERY + String.escapeSingleQuotes(relationShipName);
			String whereClause = WHERE_QUERY + String.escapeSingleQuotes(whereCondition);

			String query = QUERY + escapedFields + fromClause + whereClause;
			System.debug('query: ' + query);

			//Guardar en la lista: FieldSet, Objeto y Nombre del Objeto
			mapReturn.put(S_OBJECT, Database.query(query));
			mapReturn.put(FIELD_SET, lstFieldSet);
			mapReturn.put(OBJ_API_NAME, relationShipName);
		} catch (Exception e) {
			System.debug(CLASS_NAME + ' - ' + METHOD + ': Error. ' + e.getMessage() + ' ' + e.getStackTraceString());
			REP_cls_errorHandler.insertErrorNoFuture(
				VDFV_cls_constantes.COD_PROYECTO,
				datetime.now(),
				UserInfo.getName(),
				CLASS_NAME,
				METHOD,
				e.getMessage(),
				e.getStackTraceString()
			);
			throw e;
		}

		System.debug(CLASS_NAME + ' - ' + METHOD + ': FIN');
		return mapReturn;
	}
}