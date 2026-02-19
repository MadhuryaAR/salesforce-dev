class Foo1 {
    public List<Account> selectBy1(String var1) {
			sbgplatform.fflib_QueryFactory fieldQueryFactory = newQueryFactory (
			false, // Include Field Set Fields
			true, // Enforce CRUD
			true // Enforce FLS
			);
			fieldQueryFactory.setCondition('Id = \''+var1+'\''); // Unsafe
			List<Account> records = Database.query(FieldQueryFactory.toSOQL());
			return records;
	}
}