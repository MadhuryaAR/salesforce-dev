class Foo {
    public List<Account> selectBy2(String var1) {
			String name = 'bank';
			fflib_QueryFactory fieldQueryFactory = new fflib_QueryFactory(Account.sObjectType);
			fieldqueryfactory.setcondition('Name = \''+var1+'\'');
			fieldqueryfactory.addcondition('Name = \''+String.escapeSingleQuotes(var1)+'\'');
			fieldQueryFactory.addWhereCondition('Name = :name');
			fieldQueryFactory.selectField('name').selectField('Id').setCondition('Name = \''+String.escapeSingleQuotes(name)+'\'').addCondition('Name = \''+var1+'\'').addHavingCondition('Name = \''+String.escapeSingleQuotes(name)+'\'');
			String q=fieldQueryFactory.toSOQL();
			List<Account> records = Database.query(q);
			return records;
      }
	}