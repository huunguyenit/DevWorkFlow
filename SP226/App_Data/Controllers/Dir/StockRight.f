<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY StockRight "
declare @user_yn tinyint, @user_name char(30), @user_lst varchar(4000), @i int, @c int
select @user_yn = user_yn, @user_name = rtrim(name) from @@sysDatabaseName..userinfo2 where id = @user_id

if @user_yn = 1 begin
  exec @@sysDatabaseName..FastBusiness$System$UpdateStockRights @user_name, @@appDatabaseName, @@sysDatabaseName
end
else begin
  select @user_lst = ltrim(rtrim(user_lst)) from @@sysDatabaseName..userinfo2 where id = @user_id
  select @i = 0, @c = dbo.ff_GetWordCount(@user_lst)
  while @i &lt; @c begin
    set @i = @i + 1
    set @user_name = ltrim(rtrim(dbo.ff_GetWordNum(@user_lst, @i)))
    if @user_name &lt;&gt; '' begin
      exec @@sysDatabaseName..FastBusiness$System$UpdateStockRights @user_name, @@appDatabaseName, @@sysDatabaseName
    end
  end
end
">
]>

<dir table="sysstockrights2" code="user_id" order="user_id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền truy cập theo số liệu thực tế và số liệu hóa đơn" e="Stock Access Right"></title>
  <fields>
    <field name="name" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="@@admin = 1 and admin = 0" check="@@admin = 1 and admin = 0" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZR1tWMAdFGUAhPyCIwme0Ed/yE6YBbum4TVhQffxXHi7osCHRosxVQG5nodNABWfLK/7fg+AG2OnPmCIumX3IC0=</encrypted>]]></clientScript>
    </field>
    <field name="comment%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="false" hidden="false" clientDefault="0" readOnly="false" allowContain="true" inactivate="true">
      <items style="Numeric"></items>
    </field>
    <field name="tt_yn" type="Boolean">
      <header v="Số liệu thực tế" e="Physics"></header>d
      <items style="Numeric"/>
    </field>
    <field name="hd_yn" type="Boolean">
      <header v="Số liệu hóa đơn" e="Book"></header>
      <items style="Numeric"/>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 130, 0"/>
      <item value="1101001: [name].Label, [name], [comment%l], [user_id]"/>
      <item value="11: [tt_yn].Label, [tt_yn]"/>
      <item value="11: [hd_yn].Label, [hd_yn]"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3KURlfFyimAkJR3SwlDzjWid9VTPDSICZ6uxK+ZN6c+N2rpbSBxODWPEJ/JzrQpnvPqnlsQnpiFCVMO+icA7Dk=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7zRM6XeZeHI862uGA0RpVlpytt4ICtpLl+2awkHuxk8nRzkMVn+4vgagVwfFIsTd4iu+c7Ke0ncJ1Fcc734QzE=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3M0soJ2hix6WocBFjOovV6D1B/4ruLx0MQJIblrJ6R4aEnXZ89kvZeS0F3GQtRW2LWsseadvMXTMN0OnHD1j7A=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulibmTiDu/1e1fIXUjQl5hcgXo+aXz/HLOiBZe/zx2+WGJB4Rg0Aocw85J5PEo5i/VlY/Hi+dIdSLFE1CiUiXxuUBGcfyoy8eea69p7CzzSrOdURpliTQBJlcY8bUfZ1mmd7Mj2U6aabGTJxmnrItJaqmd6ERAF2e8dwQUjJGN75P4dH5h11QH+t8UbA53DbhkoYEA4XY7AhF4K3LcPYULVKr5Uae5ov81xDoLeGDxFnwHR40FY3ERBJnCxDpsvN9S7KNz4lK7l2W9Ms5qwX2At17sIb6WUMQhzTpYN5dY3RPU=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1DvqYPEGhvkhcFFLA0md0CU8JCl3l8yMlhGiXpYo/WU2eavHSTaiZxVIJexuByw7Q1djo8mpAD4bUJggD1T0itIJh0Frul7ZQb0PU/rY1RcA98GQW5mtw/dp72S2IabG7qM2To7GwhoIeQEAIgUvfr4x+96HmHxr+LxAtpAa54yIgDNkIhqdUbBiWWVXZlXreAbfeeYA7SJn5aEoT8x6tIE5pk1n7LDjmZRFHcUohOs/uC+qiQf9LCTVJMKWSrE4w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzJXabelzac6jVOUXSFCLtuGyd9RUKQsBlTKorJLaLWIaAyYIcgFBh/M3F8bvyRuyRRlH+EGW5SbhTjyI1G/HBTtzoGHKRd8dftL55InWbsSOJ+iSIPaVFZKiDZpWUiFX7jDi7rEYrxutZqenWxM5EfsAr8CAe3RRzCOWnGziJ0PXg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &StockRight;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzLZxosfPAOt9ojKQB33X0vUnQSR+N0NmPuCvRj3JFiiHVcIJj/DrAw/+08VD9fdy7mraZwdFC31K3Lau81HdtVJ5S3ZAvUkN8kk2uyyOvsmif7arRJayBqmuM0LGxSrDKPufW7K38DBzvn/jcMJZW5oA8M4/Dn3nEtJFtt60htlnr7QpyWbM/5NSBx01MydRVUtEAThI6P94mJ+UTCOA5LaXhJuxq0d/qog6gi/D0bhaVux7ogAZOTQ9un9XLG9+HaF1HA2bFoEV4yaMBjadaD9</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        &StockRight;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &StockRight;
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krgxBusJxKUEqov6jXC6/jiWqzLPDtwSV1R7l3ic6tFwTIE4bmyNKAmxQfvvY9ox2xRuAaTLM3UcBxH9fckZ+MDyUE8UJw8TLQobAzZhtpKDsE1MvHQWMaLRPI1r5+KUamUywQRRJLcQfYimZnwarKTQqN+241FWlPO7LcDP8cf6fF/jeKcCL+g7RpzWHq31WMMIcT2xghhojk3J41ZR7PP2V/wrVVGjkZA+tsrNCXUaD+/SLLi/9cU08BxLUYMfwDBSlgUpxhPR15DnSGDsz6JIxixepFSwcQAZeo66c1cj98yvJZ1MMnmoEK2q7b3KNZTS9zVFZYQFNAW5UKaO04y6M28nkFzOHhP6yrTeVmjrTle9F1+bBfdSUjK5QFZjOlQyYCxsBz6a9HhgAKbXAM6wCh2dmtSduIAyb0G6tbqPP31arMKMxe6+Pz6APzmZd/A=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JJQp7dPbEcp6GSxcusjZda2ePju1b2yYfxnlyw/VL1e330F3g5Mh9gBnX2qv3isNETu/bRXU1RPWNq57iZlSe8QmWK/QKdwo4hgmGOtw/eyyl2ae77BR3UDEfIYVC2bVs9v+7rzcVW81Z4FDexj4kKsDZ6oxbGVnkL6pXiHKEc7TAKq5ljyDqbU6PweDv9dYpCfLoQQuh8S2hE2wus7+fKp/hLtSo89nTW1zonxZg8V0ViKVMSq+fnrJhmxNQ8IBmvBtPnIPY0M0jsOq9dmHWyULTTL4F1MX4vXdpWf+FGH2ShlBLhYZjRU1599FrQGsr/XzMYP/hxBD+4J/EM0vPOIGEjoVChTmnbP75M1t73q+cH+gPAA2/3URnUC0Kw8W5o95Tfa+5SBqmMEv4eqoNigWg8ghrpBddAdXnH/a8wzuYHdh+t1FBgvdRJECQlsL/ADuk3a5bM6tM2zkv8Bj52ze6jWiLoY1lCcM/WmUkhGujVIW79noLm0/Jqkm1vaLg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqntNnUgeUpd5+2P86AipOFoZSSHVe9urXHKUF/tsb9a1bF/ktB+skylIKj6EnOnQ+JoO+PQlfssr6j+W2geFuBpp4d9qdT4BaVpBpAxscnN+BQ=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>