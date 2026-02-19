class Foo4 {
    public void falseNegative(String varId) {
			String Id = '1';
			String baseQuery = 'SELECT Id FROM Account WHERE Id = ';
			List<Account> records = Database.query(baseQuery+Id); // Safe
			System.debug('records : records ='+records.size());
			List<Account> records3a = Database.query(baseQuery+Id.valueOf(varId)); // Safe
			System.debug('selectByName2: records3a='+records3a.size());
		}
}