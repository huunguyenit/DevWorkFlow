<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetRandomKey "declare @rkey varchar(16)
select @rkey = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rkey where id = @@userID
">
  <!ENTITY UpdatePassword "
declare @invoke nvarchar(4000), @action char(1)
select @action = case when @@action = 'New' then '1' else '2' end
select @invoke = 'EInvoice.Account.UpdateUserReference(' + rtrim(@user_id) + ',' + rtrim(@ma_kn) + ', ' + rtrim(@$aes_pass_hddt) + ',' + @action + ',' + rtrim(@oldUserID) + ',' + rtrim(@oldProfile) + ')'
select '' as message, '*******' + char(255) as view_pass_hddt, @invoke as invoke
return
">
]>

<dir table="tkhddtnsd" code="ma_kn, user_id" order="ma_kn, user_id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo tài khoản kết nối theo người sử dụng" e="Account"></title>
  <fields>

    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true">
      <items style="Numeric"></items>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="user_yn = 1 and status = '1'" check="user_yn = 1" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZeU3jfU/p/SNItQ2lPiZfX6XQV1mfoEoyxMs3aQQiXxLI3KoZRRwGoBPmYlUGitv8Q==</encrypted>]]></clientScript>
    </field>
    <field name="comment%l" external="true" defaultValue="''" readOnly="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ma_kn" isPrimaryKey="true" allowNulls="false">
      <header v="Tài khoản kết nối" e="Account"></header>
      <items style="AutoComplete" controller="EIAccount" reference="ten_kn%l" normal="true" key="status = '1'" check="1 = 1" information="ma_kn$tkhddt.ten_kn%l"/>
    </field>
    <field name="ten_kn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_hddt" allowNulls="false">
      <header v="Tài khoản" e="System User"></header>
    </field>
    <field name="view_pass_hddt" allowNulls="false" external="true" defaultValue="'*******' + char(255)" maxLength="48">
      <header v="Mật khẩu" e="Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1tsRx1/cjsycNYxfWXh6BH4kErpkNwFreg//uLxIy4SU1</encrypted>]]></clientScript>
    </field>
    <field name="aes_pass_hddt" external="true" defaultValue="''" allowContain="true" inactivate="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101001: [name].Label, [name], [comment%l], [user_id]"/>
      <item value="1101000: [ma_kn].Label, [ma_kn], [ten_kn%l]"/>
      <item value="1100---: [user_hddt].Label, [user_hddt]"/>
      <item value="1100--1: [view_pass_hddt].Label, [view_pass_hddt], [aes_pass_hddt]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &GetRandomKey;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Cb9DEg9VFeHZcrozoMSzerKiX+8Qk3ntOpB7c+2j/4hVvdCUjtHNu/Mv7qh8xHoM1990GDnZ57iy4tLfiXJGjetIlrqKaL/Zkwysz4FxwO7CpFzOL/kczDEFflSsadTUQZI9V1Xn/w+AMcurxsvl4=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyKnXBmEw6DYKI2ILG6IQpB5XZDh41nMuOV+XMgkro/sZ6yRsE8Sqa/8/jWdhrXBbrF2+sr2KeOrjeGqr9C+TmA=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYIOW0va7K8ykdWiLPjhxhG0UPpwRsnLerR1fNsKWPk03tXgSi0EHzVmgB+Oz8F+pUo=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3ouu6c6KZvkEiCSqOiJdFt2GhV5ZQ1wWf3zMNB4XE7jJ/3pLV7IC7OYvne64tGd43/GqJJahnwYvMW7fVKhKN+mjk3R94XCTcCEhCdsIXx+phr9fadg7MP4BNaCl1ni6ait0dnB719jFhM+fDkbVdy73/J9ghdPzwEMTTLM/7SPJJwUhD+R0HER6l+iECqUmAZ3wW2efr+atuCJb15zj5k1416vgTCFXhSFi9NnILnffpQRafomWiLDb9N7big1iKgbPdeWN7WoU3ijsiSbTsJXDS/HNS/EEFEKf0S3VzLSS5emB9hY9PKzGN4PJnCEOBFHWhMPP/KZgFMJwKPG4+Go7WuzvOPXWHqfYI5aNEDGnk4BIt7JRiI5CPa9Uk69ETbKS9BX1AwVLUVkatruMtxA3RJLZ2q719PKdNzovPViH0t9SyA/YNodzk8x492EKEf3FKPIH/4mX0c+ncu3R9uK4qz36SSPcwEBAsPa3EEit1Pb2AxJ3udttVTQdrLbuB9xqtf1oX14/Tc3ehPCU7PAURoSHZ2kCG4gl57gtvY2IN7c84zRx1fZIFjlOI2o1dMXWhgeYcZ+k51oFcuWSp6G6KwGjZfu2CQ15zst2tmpqQ==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1DvqYPEGhvkhcFFLA0md0CU8JCl3l8yMlhGiXpYo/WU7nNx8jhsi4YcyaQgRwwVBq6lpYRPdUMUZd+AbXY4ssVz96NyzkayDK5DvO98XXGclLBVd7l26rK9ZI5ThNbQuPjrijvZGOwHZD9ubcMWKb95Gu8INnOKLcjxZPtz9v7Y7Wn4wWE8vRPYeu2Y/kY8U9BIVEyIbSZdPir7E9An423gkoDwvXKni2n/vKjS/cgD</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nqxnsQodNPkHWi8z6+3rL6faYLqFa/gumKLM3jhwHk2v6EliZZt20jzQTUxob+psaU7oNZ5osd8G0kGpR3hIL7zYjy+sx6szeu99VPRQp9vk5RPCUU7R9iSclTfrMNCF498otN0huc+lEFTtY+ukqMgJp/9HEz2N0Mzc5NdTbpa+ZsnsJslaOpfrUzgUpOVpgdjYTRHZ8aU+CWZZdyx+pqGwEhjfOtjOeCwsPjfx00wp7sU4nd5M3eqR1ytUxsfKmoa1m088q5AwhM7o7X/tXZzk0KFuzuAk3Nfy5K6/nKJnHeXtQLdSL0+Sb23WF7oo4</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &UpdatePassword;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%j1otayK5ACecpldW/VwtPBdclkeSZ2GTaquHeD5ySH/WTro/l23Vg1owSDkD5pl53+GVUUL6ODNjYEjwG1EuJiBd6l18TtB9Q4FfyZvWopCA0c4wvogp9rJAgUfmnPCkdVIWBXLMgbBwKOqUSthscjBTh/JoSzK81D69Ujatso3AF21YLyrUoOcxCp6ZVW2ZwkEQW9iBCjWV9S8r/VXLbs6r0eplB9qGmWPfUvvynG/8v/4MBDoowxoTBXENeEkItDmgLcvTraUgN28ElsyfH+uBZ3Xe5rQTmSUlkxeQY4MMpWrUkTGtzqZOoEUReBv4Xp21ud8IzaTDg2u/H8Pi5s3WT190hrUfZJOVJuK88ScW8+tR40Mw+n6o/abDInyN</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesF096VMjkRihK49tZ/1Cm40YlK5SbBf7TXCMlV51+T0BGsTdvoRkuThA4THMWKYncizIKERhnbQ7OKFJZB08pFMwN+A8mh9huEzBkXPZU7H</encrypted>]]>
        &UpdatePassword;
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bmcC9DnqVXSzDoHF38ZsCy2igONhO81rhLZvPBH/C16K4mrWRAcBGz41kdGZmaM/rOlxbngdj8eBOPVE3k366p2gahlNqzoQ4HC0dMHHO/U680vqwEWXTj887tNJqIW7WwFP/cwy5C12QUnTKL8kmSmcMN1IlWarpHdGmQ3RDIEEjHFiPYlUUCICXxS9V3aoA==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/EQqz85GO4GXM2yxBmYhbaIKmVwAMSN7xjvxjE63c2HhQ5RdvFs+0X3gcaWgAr3JSogUk8kSUWdFIpqz/dwty3jPHl88npK/RA4pbg2H2hJhKvhb6vPIxHdcKIudZYCQxVBt21sEJVI99tkDOXCYoh9J+NyTKG1x5nrt1EB05hMfAPA/AgabBSaQKI5PgkRc6Fngaj+5umcSgyx5o7fdXbBI5rumr3DBE+EeADU0rB/X6O+5TCC/W3AEFEvgDmj0/lr1uDb1cFQN6iFy4vEUIEWIofQZnmwew/dWxoPkQVIsDg01MG4NbzTd7Y9cCBXkD5VjPs82J4ok1zXPxFZ0LfUhvu3ZW5NA3rzE9EOzaAF</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZpbOOxDL+f+35TUmms0aB/AkxRh+AsNHDOPZh4aYr6QCYiMCUKUUc1iEmpFbNkuUeCPQ0bVmB3WiiiRTT7Lw+Y/Wpvmsid7DZjmDKitm8yx0s6zD2gBCROtjW98HGeurCBQ83373lbgKyp2b+uG6+J0woj5ileYsYmOF60+2+jArfZXY1G66wW48l1hc9h9MKHkUlnlWxrcmskZL9bQYS1dGCfNLsof4/nVaPpdSeuda08qT8XJ+pfg5oZQNx8GvGAEShv3+Y+LW2DFUHmYrOzUK39P1BgIa3wfW9J28BGkgIx4yQyXSNpJj2IDtvR5Ismi/rOYeI6niieg5zL1K8N3Hb1fX1UVH+/3ByRpTD1mRLj14q9JQawqMd/pnM/VOP2fpkO8jJIrxJoYVw/MaQNL/fMgXMfBGi2rImg5Ew0oP44UYOX/UWa2WHsFrATTEcXuifV77cwBMRFfsb6B1Q29cy9v5ghFmirDwbgH0hvjrfFog3bOL+QrlIaDB9sv7M+gcn6+UrRtgRWUbOVkh25bmVygQyk2JGOWFB9m8DxwGz2ZnnlQNcaQqDf1Jg8Po+ihV8cND07KfL4an4i6x7xtHxC5VbSNu7SlQU3Ch0hBexN1Cp/xp3JNZBZTsZuRKE1/wmRU5xrJtW9eBwq2R158ehnZZ3trs4T8zNehvAJVLh9qguMAPe02sK3ibvOVzbIdWUs3Epgw+ax72qTUQru/6JjOVp0J/55MagfUWvCvbJgpl46jsi5ltqx5Ff8n45yz1KY19rPcqp5LQaVsXs9BByoMnJUOj7lYf5ABflTUoPhM7v7Q++TpBz8k0pYlEG4fJ8UECigb014nTEe40dQ8GVDB5JKDHN0vqL/Mjf1eo7yt4Hn9GHQoqFRsXSDS3PFv3FbS5tV8CxYvGDY7ajNXopXVDUcx9is38yM8FSWD1d78+hmRT7KU5yuJWJmWxyftiIfS1l+h/J9X7i9Jjm9tVnRLWGhau08rgWiFjBp6MdaiyV5IUzD8gmCPTMYc7eu2t/T+jrKrydeKyv7jrNbr7xzKa6LfiTIZmD1IiTsxUa1aMqIwhA8aKpcYehDZuYncznQw7gvu8lgb9UC7qlEYfUkCpVCcR28wKOQrZ1OEISjWIA22xLFDmyO8kkopGRUN4F0b/qzO3iPzGZB8g8tZw7e7qUvQNrpE79LorjaF1pjmsAipgUs5Ndnr3nxZRax9hfk/xM0qddjRDOPVDsS</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqntNnUgeUpd5+2P86AipOFoZSSHVe9urXHKUF/tsb9a1bGBY3vkWawr94C5Odtdnn0YuPJBoRYi8Hpsc8LsqtiTc5UCitMN/X14q5Xc3i83zeobnAKzMyx96e3zJhhQip/O2nscg2NpW3S/seALbrdVyA==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>