<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ReportRight "
declare @user_yn tinyint, @user_name char(30), @user_lst varchar(4000), @i int, @c int
select @user_yn = user_yn, @user_name = rtrim(name) from userinfo2 where id = @user_id

if @user_yn = 1 begin
  exec FastBusiness$System$UpdateReportLimits @user_name, @@appDatabaseName, @@sysDatabaseName
end
else begin
  select @user_lst = ltrim(rtrim(user_lst)) from userinfo2 where id = @user_id
  select @i = 0, @c = @@appDatabaseName.dbo.ff_GetWordCount(@user_lst)
  while @i &lt; @c begin
    set @i = @i + 1
    set @user_name = ltrim(rtrim(@@appDatabaseName.dbo.ff_GetWordNum(@user_lst, @i)))
    if @user_name &lt;&gt; '' begin
      exec FastBusiness$System$UpdateReportLimits @user_name, @@appDatabaseName, @@sysDatabaseName
    end
  end
end
">
]>

<dir table="sysvaluelimits2" code="user_id" order="user_id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giới hạn quyền truy cập cho các báo cáo" e="Limit Access Right to Reports"></title>
  <fields>
    <field name="name" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment" key="@@admin = 1 and admin = 0" check="@@admin = 1 and admin = 0" information="name$userinfo2.comment%l"/>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true" readOnly="true" allowContain="true">
      <items style="Numeric"></items>
    </field>

    <field name="comment" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="1111: [name].Label, [name], [comment], [user_id]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulibmTiDu/1e1fIXUjQl5hcgXo+aXz/HLOiBZe/zx2+WGJB4Rg0Aocw85J5PEo5i/Vl4hCgUCOtwSCawAEYJmcV/C0K4NJG9ZK4ahWNyxBaI1+kbdGBe4RpltZ2q13weMzjMxw3MrXBvDk4C+TSUxvbqmfVk7TIGgw2EoBMtPQ/XLpmebFm5E1NZpE08S1LbFKUllYHXHaToUHjQs/bD/1dkYy1/8reP0Yfgd1WZzxTZsshpB8ROjZC6xlgno6bp0odoiPDcnwbRt1eVDY/L5ydHh4m594P3eBzWf4S5FWNkJnhJLDxj1F1pVlMOc/d2j3a</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzICOECFNPqE6VQ4ON8GJ1Z4US1QyNpX8LzJE05I1G85pESfknB49ja4h1NqrVq23ckPPpfjTHT5KyCoF2CxnXwLIs1/1efSdppikMujx8nRtjxXZGSfZx3BDY7aQDXcD/8jJzs693fce+BSBH1n9e8V76PXmyclvyoLdsKxYhbWJ83XEVzmCgb9uBEm1f1KzaqwgFndGEtnv3CmD8JVw2toMMnvPMMll9urWq28ZXJKnQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &ReportRight;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6AV2m8bLVesUEa17mg8ne85hkfQlkLBJCBUZtVcQckNAq53IJCdx3feb/gqkBcfGnkTdRZ6MyQnCtjseeva6r8VB/4x2cMJS7A60xaWj/eho9XdBvj19kddsKw5vCtIEw==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        &ReportRight;
      </text>
    </command>
  </commands>
</dir>