<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY VisibleField "
declare @user_yn tinyint, @user_name char(30), @user_lst varchar(4000), @i int, @c int
select @user_yn = user_yn, @user_name = rtrim(name) from userinfo2 where id = @id_nsd

if @user_yn = 1 begin
  exec FastBusiness$System$UpdateVisibleFields @user_name, @ma_mau, '@@appDatabaseName'
end
else begin
  select @user_lst = ltrim(rtrim(user_lst)) from userinfo2 where id = @id_nsd
  select @i = 0, @c = dbo.ff_GetWordCount(@user_lst)
  while @i &lt; @c begin
    set @i = @i + 1
    set @user_name = ltrim(rtrim(dbo.ff_GetWordNum(@user_lst, @i)))
    if @user_name &lt;&gt; '' begin
      exec FastBusiness$System$UpdateVisibleFields @user_name, @ma_mau, '@@appDatabaseName'
    end
  end
end
">
]>

<dir table="hdgrouprights" code="id_nsd, ma_mau" order="id_nsd, ma_mau" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo ẩn trường cho người sử dụng" e="Hidden Fields Control by User Declaration"></title>
  <fields>
    <field name="name" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd%l" key="@@admin = 1" check="@@admin = 1" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZbFP9l/Af05KOJJFEmSUzNeV7m8rYXVJpieVN+97GEn0VB0ihnwWyn7ptx69cFh+Bg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="id_nsd" isPrimaryKey="true" type="Decimal" disabled="false" hidden="false" clientDefault="0" readOnly="false" allowContain="true" inactivate="true">
      <items style="Numeric"></items>
    </field>
    <field name="ma_mau" isPrimaryKey="true" allowNulls="false">
      <header v="Mẫu" e="Rule"></header>
      <items style="AutoComplete" controller="VisibleFieldRule" reference="ten_mau%l" key="@@admin = 1 and status = '1'" check="@@admin = 1" information="ma_mau$hdrules.ten_mau%l"/>
    </field>
    <field name="ten_mau%l" readOnly="true" external="true" defaultValue="''">
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
      <item value="1101001: [ma_mau].Label, [ma_mau], [ten_mau%l], [id_nsd]"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1ClKPG6ETpU6tcv6SYrP4fpZez42WH5dmmTcWEVktUeLrRcRYdGKZepNS9JKr6t8tvJsmBfhP0rMzPZ2AGrlT4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Jqjuus2CT64NOgnRI9aJzlVV4HpJhRvzGb/ffa+wmkVLQo50xZHyllG+m88txyC1NQv2N+BYptbH1fBnNjWO8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbRptsr13iekuFddlJY0mM2fK+oF3iRl1qC+7kUXOWfRbMJJ3FfD2ehqzYE9ZPEHqtQV6kagVpOJQXwDyrfEkg7Np+m/jl3yTrTiKzwAfHtKoyUSbqupSCH4OI1lw36w+FbwpbryuI7vWRm6RwBg2uL888enwbCDE4F9j7I9aWV6uu1vRUjHagOn5lpVJZBDRwmSt0P4ccQq4K25TF19gbKqGK0yZSvw2HtI6WfF+nagcN3FOIBOW2hGRVmyUTuEzwFVkedCqI3zVtKbbGplcxZl</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1DvqYPEGhvkhcFFLA0md0CU8JCl3l8yMlhGiXpYo/WU2eavHSTaiZxVIJexuByw7Zqv9lFARiNw8CqWu9jYML7RRT7Q2h0ZRDXPCcLOfCjK1J9JWbMB/Sn/J+pfCqzLMTUlPT0Cfx8p9ySufH3GgMYSL49uvYNhV7a9S3M1n+8kuUidt3OMG04lHPZ8Kzf65xcuRk08raI3GwXWDRn4pXNHj2etNbkWEQzeoaB7a2+26IFGT1wMXmFufvmur4qQ7ktRLwa+rHlXRFXed4LFr2fQvJ2AKKgxnOS5KNrLyHFfNMqIBgY2FlZDqCPdbWizZA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzJXabelzac6jVOUXSFCLtuGyd9RUKQsBlTKorJLaLWIaBxz7gYDdzYXS/fzZ7p/FHYsC0OxBwFn6NdxRmc8WQ5X94hGzatlyXnncd3Ffdsuk/XW0ptlPLLlWBjZG/tDxYqz7pbfyvC9QhihbXpT9044ExRqYcHulYJCQjql2HhYI/MJfZsbVYqi75fc3Bl+IcAmOA9zdbdEMbarh7qWshW5</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &VisibleField;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzeUaxPtI2chZ+wuVcUrt9qPhvt1qO89qVYIYYxE0fuOqEdl7ILQ9/p5GczM3mFpvbMTxQHtXdh5gS08p/wJVkCQLhNBt0jwwVe/lTycFD81bugROcQ5DevROeMK6qOmtuyFmQbW+Myl7McHJ3cV5IBNRerFRFOL/cN6nLukgvPZrv1c6xqd4Ksj0FPJW8ngug==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VisibleField;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70N9D4gC2pSpXRWpIAmqfcutjdHCU5vRK4cNiiMNX34Bwo17or/kA8pWWGpTfewFB4dAcpBx/y3O2GEHzf7Oau4y5sErObZXaoL5FYtVsPeZNhZPliSeZgbsgkfvcGzCw9NO81sOuII0y5bWVV2pSWC7zcAWMfdWXUKuEX4sTYA2tLG5ab0bJUihVR7HPZVrThuiSDtMDN8Er1yu3TCK7bBqxnJEzYHeCjWQ4c4H6I8cZ6QzYRCVcGi8l94l4+L1c+Vf2iLL9G0UXYASH2y7z4bjJVLFpszW1QlMptatM4aItxJzN1JIO2IxAko66cqryZcVr4VoUOftmc1Ms6aRD/HurW0+DfHH18dclp8xsHbsIPRkwQV78b7N8an226+WrDzvvBv71P4W1Nql72U1fxrT9/+CdfJidrgPwgyF/flodUdoCBMwVXVOvZ+A7f+yfDES8AxNPp7FGHx1FxBAtfEi7WZOx3k+Vxp02upDorczXarG6AvnhbRfzVD03l7HMcw==</encrypted>]]>
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