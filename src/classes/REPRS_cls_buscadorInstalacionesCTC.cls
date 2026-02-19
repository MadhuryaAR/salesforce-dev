/**
 *  @name: REPRS_cls_buscadorInstalacionesCTC
 *  @version: 1.0
 *  @creation date: 27/05/2025
 *  @author: Lorena Moyano Montes - Accenture
 *  @description: Busca instalaciones desde los ctc de vvdd y eess
 *  @testClass: REPRS_cls_buscadorInstalacionesCTC_test
 * */

public with sharing class REPRS_cls_buscadorInstalacionesCTC {
	private static final String CLASS_NAME = 'REPRS_cls_buscadorInstalacionesCTC';
	private static final String QUERY = 'SELECT  REP_fld_account__c, REP_fld_account__r.Name, REP_fld_account__r.REP_fld_Kunnr__c, VDFV_fld_localidad__c, REP_fld_codOrganizacionDeVentas__c, REP_fld_fechaDeBaja__c,REP_fld_billingStreet__c FROM REP_obj_relacionVenta__c WHERE REP_fld_account__r.REP_fld_codigoCTC__c = ';
	private static final String QUERY_DOS = ' AND REP_fld_account__r.RecordType.DeveloperName = ';
	private static final String QUERY_CODIGO = ' AND REP_fld_account__r.REP_fld_Kunnr__c LIKE \'%';
	private static final String QUERY_LOCALIDAD = ' AND VDFV_fld_localidad__c LIKE \'%';
	private static final String QUERY_NOMBRE = ' AND REP_fld_account__r.Name LIKE  \'%';
	private static final String QUERY_FINAL = ' ORDER BY REP_fld_fechaDeBaja__c,REP_fld_account__r.REP_fld_Kunnr__c  DESC';
	private static final String PORCENTAJE = '%\' ';
	private static final String CODIGO_CTC = ' :codigoCTC ';
	private static final String RT_INSTALACION = ' :instalacionRt ';

	/*
	 * @creation date  27/05/2025
	 * @author Lorena Moyano Montes Accenture
	 * @description Método que busca las Instalaciones.
	 * @param Id idRecord
	 * @param String filtroCod
	 * @param String filtroLocalidad
	 * @param String filtroNomInstalacion
	 * @return List<REP_obj_relacionVenta__c>
	 * @exception Exception e
	 * @throws Exception e
	 */

	@AuraEnabled(cacheable=true)
	public static List<REP_obj_relacionVenta__c> resultado(
		Id recordId,
		String filtroCod,
		String filtroLocalidad,
		String filtroNomInstalacion
	) {
		final String METHOD = 'resultado';
		System.debug(CLASS_NAME + ' - ' + METHOD + ': INICIO');
		System.debug('recordId --> ' + recordId);
		System.debug('filtro código instalacion --> ' + filtroCod);
		System.debug('filtro localidad --> ' + filtroLocalidad);
		System.debug('filtro nombre instalacion --> ' + filtroNomInstalacion);

		List<REP_obj_relacionVenta__c> listRelacionesVenta = new List<REP_obj_relacionVenta__c>();

		try {
			if (recordId != null && Account.sObjectType.getDescribe().isAccessible()) {
				Account account = [SELECT Id, REP_fld_codigoCTC__c FROM Account WHERE Id = :recordId];

				String codigoCTC = account.REP_fld_codigoCTC__c;
				String instalacionRt = REPRS_cls_constantesCRC.RT_INSTALACION_RT;

				String query = QUERY + CODIGO_CTC + QUERY_DOS + RT_INSTALACION;
				System.debug('query --> ' + query);

				if (!String.isBlank(filtroCod)) {
					System.debug('Filtro código aplicado');
					query += QUERY_CODIGO + String.escapeSingleQuotes(filtroCod) + PORCENTAJE;
				}

				if (!String.isBlank(filtroLocalidad)) {
					System.debug('Filtro localidad aplicado');
					query += QUERY_LOCALIDAD + String.escapeSingleQuotes(filtroLocalidad) + PORCENTAJE;
				}

				if (!String.isBlank(filtroNomInstalacion)) {
					System.debug('Filtro nombre instalación aplicado');
					query += QUERY_NOMBRE + String.escapeSingleQuotes(filtroNomInstalacion) + PORCENTAJE;
				}

				query += QUERY_FINAL;
				System.debug('query final --> ' + query);
				listRelacionesVenta = (List<REP_obj_relacionVenta__c>) Database.query(query);
			}
			if (Test.isRunningTest()) {
				REPRS_cls_auxiliarPrueba_utils.throwException();
			}
		} catch (Exception e) {
			REP_cls_errorHandler.insertErrorNoFuture(
				REPRS_cls_constantesCRC.REPRS,
				datetime.now(),
				UserInfo.getName(),
				CLASS_NAME,
				METHOD,
				e.getMessage(),
				e.getStackTraceString()
			);
			throw e;
		}
		return listRelacionesVenta;
	}
}