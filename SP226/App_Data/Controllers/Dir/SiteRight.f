<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY SiteRight "
declare @user_yn tinyint, @user_name char(30), @user_lst varchar(4000), @i int, @c int
select @user_yn = user_yn, @user_name = rtrim(name) from @@sysDatabaseName..userinfo2 where id = @user_id

if @user_yn = 1 begin
  exec @@sysDatabaseName..FastBusiness$System$UpdateSiteRights @user_name, @ma_kho, @@appDatabaseName, @@sysDatabaseName
end
else begin
  select @user_lst = ltrim(rtrim(user_lst)) from @@sysDatabaseName..userinfo2 where id = @user_id
  select @i = 0, @c = dbo.ff_GetWordCount(@user_lst)
  while @i &lt; @c begin
    set @i = @i + 1
    set @user_name = ltrim(rtrim(dbo.ff_GetWordNum(@user_lst, @i)))
    if @user_name &lt;&gt; '' begin
      exec @@sysDatabaseName..FastBusiness$System$UpdateSiteRights @user_name, @ma_kho, @@appDatabaseName, @@sysDatabaseName
    end
  end
end
">
]>

<dir table="syssiterights2" code="user_id, ma_kho" order="user_id, ma_kho" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền truy cập theo kho" e="Site Access Right"></title>
  <fields>
    <field name="name" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd%l" key="@@admin = 1 and admin = 0" check="@@admin = 1 and admin = 0" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQYHWSOVg8l68vvGg6UilAec2vNnMepY27egxYavZzdU9NLdzlffdkvSCTnkkS1CsQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="false" hidden="false" clientDefault="0" readOnly="false" allowContain="true" inactivate="true">
      <items style="Numeric"></items>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls="false">
      <header v="Kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="@@admin = 1 and status = '1'" check="@@admin = 1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="comment" external="true" defaultValue="''" disabled="true" hidden="true" readOnly="true">
    </field>
    <field name="id" external="true" defaultValue="''" type="Decimal" disabled="true" hidden="true" readOnly="true">
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="11010011: [name].Label, [name], [ten_nsd%l], [id], [comment]"/>
      <item value="1101001: [ma_kho].Label, [ma_kho], [ten_kho%l], [user_id]"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf74V50yjr6pkSDKNI3rzIyn3/yjdCMwj74DqgstpS8qdGAJMwOEp8hj/kgN14R4DM4jmMP/ixZqu8CS2Ij9vOjk=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyMlnRq2T21l8v5S8Y7oS7e0FlqcxDtygf0WCTjLDVkcp/6VfSB6Zqo5ty2GDAhgfkNjjEdjjr8yTA39q+urmrI=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliAtU1IevzYZnIFpg0A7zsFLJu4Nn4G/+Dy5VpWlwLY4SDt8vdDLuPN+SelZPjMLdm2Uw02UdzgEyf+IUsKhoifKchysEflCF/tLj+sEQtYUt31YC0OOMyZ5ykaNWP3hnfi7UvV/TGkzf2Xb1XdM44ifkd+6onADlprNITCTV/9eDryTGrSxSl+WXQ55Z8wCHzFi6HdegIaoMRWiQKINe+ZiPw73ow+0EMQ+xnaUvWaC9C1gXBy4GEOySgeiy3YCiWRG2Kuf5bsYE1BQ4SjtbOMoHo5MkQTXIeTaqbzR+j2AZUu32+sAWaEbp0jgNvKp3u</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1DvqYPEGhvkhcFFLA0md0CU8JCl3l8yMlhGiXpYo/WU2eavHSTaiZxVIJexuByw7Zqv9lFARiNw8CqWu9jYML7RRT7Q2h0ZRDXPCcLOfCjK1J9JWbMB/Sn/J+pfCqzLMTUlPT0Cfx8p9ySufH3GgMbafk5CoglL2yeLLRJ7YHzGPwtRPGnldtFyrBb8SCL73x9dqXlOBa5Cn1IBWZcBl4JRJhXPNSS04MIjL11nPqFLvwkT83cqkXle4S1q+oBOeUq+4lRwY8EOMT4iq+zjKWfLDv3grFx6MxETEg/0DmMqAUzWaOZj8q6P9gwC1F0tuw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzJXabelzac6jVOUXSFCLtuGyd9RUKQsBlTKorJLaLWIaLocDfyWkNISkZGU6g3joAg3wdcu5jdnhH99JilHv8UXwU49Oy1R9FfFl/8oe9jnzSfBLa+cSBEqxH3TkzSfwYRT5ST6+zmyZvgvYVaab3zh9vjIxN+aGFGlYFEnZF2TQFQxyIR06lUM4XL/HHG0bNxZVuT6GQZlz7xcqHFDERe7</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &SiteRight;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzeUaxPtI2chZ+wuVcUrt9qPhvt1qO89qVYIYYxE0fuOqEdl7ILQ9/p5GczM3mFpvbMTxQHtXdh5gS08p/wJVkCQLhNBt0jwwVe/lTycFD81ENaNeXQ0aa/EudXaDfS1k2VEnPFGubslTXLUFprTJyumm/l5zjAemce7DsaHQxgdsVhWleaUJCxh6rbQCYO6UA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        &SiteRight;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NjMPwFv+JL7ubeHB7A/j9eBz9T5mWHqHEhqbj0TmXUJ/BZilcgIYeES4lezSFQYYkB8nA50q8f1oUvTKDNL4+TWTSFfwkXNsgNWavB92Wsdt2YQ526YUX2s2OkpoQ5h2Yjk/Y7stYqoHh8B+AgUFZbwuIwkhzJNv3B7eDL8TI+A4pkSv6HdiMznw+e9F6Q68g/rGzIzAiryD1Aba/6TRSkcCTzUkQvby3Lb2By8KFblzOgF+7nsxXxkco3qnDJxyBiN2Gdq4AQ0O6bQkIdf//kw70MooposaCqE7WTyQuHuF6GfshEiINLVDa+1mIof/0QidMkj7JCmAU/RqJ74Fe7xjwkLBOutmvg2sPEO4sgdVStls1aexVGg7tEN6eRddbRTQnJa62eyrE8MWXdZbxd9lSxgUaNKQrskb+flFx5vP23pdaBMjKeoXhykQ+UFFZ7YoKUpInomOSpRbrIOIXxRsE86x2vkGJvW4mCoQRhOUbmzAwKRXOyNVIQzKQiFKQ==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqntNnUgeUpd5+2P86AipOFoZSSHVe9urXHKUF/tsb9a1bFx81L842NOhmXBhGfdsqqYBKzpDEMAYoh2J3ZgOUT8aSTa8meobpri+il2m0FPKBvD6Hd1lQxQWkaXq9FwSSrSbiOJUpp7n6yJ1p+5g5ij9mr5of9hAaJK6m2iKlW3hTU=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>