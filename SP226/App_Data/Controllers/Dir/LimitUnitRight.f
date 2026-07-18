<?xml version="1.0" encoding="utf-8"?>

<dir table="sysunitlimits2" code="ma_dvcs, user_id" order="ma_dvcs, user_id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền truy cập theo đơn vị cơ sở" e="Unit Access Right"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
      <handle source="dmdvcs.ma_dvcs" foreward="true"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true" filterSource="Optional">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd%l" key="id in (select distinct id from @@appDatabaseName..vsysunitlimits where dbo.ff_ExactInlist(name, (select restrict_users from userinfo2 where id = @@userID)) = 1 and id not in (select id from @@appDatabaseName..vsysunitlimits where ma_dvcs = '{$%c[ma_dvcs]}'))" check="id in (select distinct id from @@appDatabaseName..vsysunitlimits where dbo.ff_ExactInlist(name,(select restrict_users from userinfo2 where id = @@userID)) = 1 and id not in (select id from @@appDatabaseName..vsysunitlimits where ma_dvcs = '{$%c[ma_dvcs]}'))" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZanEDc3gIxTrzFitSBsc2wJY90WUG5d1vWFVRY/dF361CqAYHsJkPM18AAUSQnxviA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="name2" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true" filterSource="Optional">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd2%l" key="id in (select distinct id from userinfo2 where admin &lt;&gt; 1 and id not in (select id from @@appDatabaseName..vsysunitlimits where ma_dvcs = '{$%c[ma_dvcs]}'))" check="id in (select distinct id from userinfo2 where admin &lt;&gt; 1 and id not in (select id from @@appDatabaseName..vsysunitlimits where ma_dvcs = '{$%c[ma_dvcs]}'))" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZTT1uwSpKzCFVCE+DyokzhCphW+a5NZexxv/TJUBdCzM0J8uVFS/3KYpyC5tRa+rUg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd2%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true" readOnly="true">
      <items style="Numeric"></items>
    </field>
    <field name="r_new" type="Boolean" categoryIndex="1">
      <header v="Mới" e="New"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Chức năng&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Function&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="r_edit" type="Boolean" categoryIndex="1">
      <header v="Sửa" e="Edit"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Giới hạn&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Deny&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="r_del" type="Boolean" categoryIndex="1">
      <header v="Xóa" e="Delete"></header>
      <items style="Numeric"/>
    </field>
    <field name="r_access" type="Boolean" categoryIndex="1">
      <header v="Truy cập" e="Access"></header>
      <items style="Numeric"/>
    </field>

    <field name="admin_yn" external="true" defaultValue="0" hidden="true" readOnly="true">
    </field>
    <field name="user_yn" external="true" defaultValue="1" hidden="true" readOnly="true" allowContain="true">
    </field>
    <field name="comment" external="true" defaultValue="''" disabled="true" hidden="true" readOnly="true">
    </field>
    <field name="id" external="true" defaultValue="''" type="Decimal" disabled="true" hidden="true" readOnly="true">
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 100, 100, 230, 0, 0"/>
      <item value="111011: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [user_id], [user_yn]"/>
      <item value="111001: [name].Label, [name], [ten_nsd%l], [id]"/>
      <item value="111001: [name2].Label, [name2], [ten_nsd2%l], [admin_yn]"/>
      <item value="11001: [r_new].Desciption, [r_edit].Desciption, [comment]"/>
      <item value="11: [r_new].Label, [r_new]"/>
      <item value="11: [r_edit].Label, [r_edit]"/>
      <item value="11: [r_del].Label, [r_del]"/>
      <item value="11: [r_access].Label, [r_access]"/>
      <categories>
        <category index="1" columns="120, 25, 70, 25, 100, 25, 180, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>

    <command event="Created">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyCtlCatzm3RTb/rZw3+aUxk9GY2SpmD/wlWGacZkJIfYC/uK5KHPxoppxsj25mUw2kGnRh7ndL4PmVwXFqrI+8=</encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOHwVCWfOxk4puHpTzrPBXTrL/L55GdVt+9mHE8Vb7Uu9Kfc1fhRDgedihr9rO+QD+ttsp+jsEDJ73NvPs5BF/j+G+mMqm9ehe6ZHAzPpa4m8chospwtO1mJ2nsegXmw4A</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1b1Z6DQVvjDrs5T4h/4lG5BKamCeSxp0XeNwGFOCwYeaPnY48RM3pQ8084iGuQtj4NcffRA7JLNBvgXjNLRJ8Z6rKDs3GqAOQCGcDwBrtBjOSx+ujVLtwOS9N9RiUWUWykTubXBf0mTZw6JJAO3HQ6LnkhMpO5sK6IzeoBDJ+gdA3Y9QunnAPr7LyFPYV/fNhTmkLVYZVk1UrZa8yUv9kumGUOQnPqMck0ArOdTM3on6j83Fc4UzyAZKAtQ5rVo2A+oqKUVHHicnTaGoCVRoniYSA2c4JZBNC75MwMdTXYtVLU+H1aIGbsQ6B0BHMG41eTESXWMjvLmnWaIA3iktzW/8XNXsK3T8RCjGuV3zxJEo1lpmqSFuFKRIFUpSJb4JbKixyLzmI1rdb1JsTjcnznyP4zTmjETXMz7xNYarF/ZVQO1rcCGHw2ofCY6xu63+1hZxo/y1Kho12SqbF9e+Spg+aBGm19Oc2xM1bzjt+ZZR9e6/JzIwe9vC28NWl40E=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+XUj8psneUgN8q+8rzL7lUwfUenpRzhP5vFYIi4nhntrojko+XTATdEO578R0Pu55XSs4QlP8EAYbAItiIVz8I=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwNOU1pF8/FMdcLvEvIEvxhW/mLhbXSJvEnIrTjj4zKAuuaN87uMbF9+mnt3qkcxb8qqLH5rpVdCRcBe/6dRGG1KCth/ac7JLmLuw+wy/xThROo6sXCeR9rE2JgZeXxvJ0aska63URxs25Oh7a5Day6q1swSm3gF2eVSWc1f7s+JgPU82QYAHGBYI6YUBew92urDYeMmFhm5A1iF5S2DhzcKcqmQvnM9WF/ZN3kxk/KderipfJFR5bm/94UxXUGSSnAkFmJbH+sG7FIfkIMzeBaV29jXu93ek3mBG5z1g6KykONxvVJOx8h/PsYwLdQCsljx7ZfY9pUSeVCRuK3k/5vAKVtK/0v8GyuILGvzNkZeA9tTln6Zt6yHhlmlDvTgXA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwNOU1pF8/FMdcLvEvIEvxhW/mLhbXSJvEnIrTjj4zKAuuaN87uMbF9+mnt3qkcxb8qqLH5rpVdCRcBe/6dRGG1KCth/ac7JLmLuw+wy/xThROo6sXCeR9rE2JgZeXxvJ0aska63URxs25Oh7a5Day6q1swSm3gF2eVSWc1f7s+JgPU82QYAHGBYI6YUBew92urDYeMmFhm5A1iF5S2DhzcKcqmQvnM9WF/ZN3kxk/KderipfJFR5bm/94UxXUGSSnAkFmJbH+sG7FIfkIMzeBaV29jXu93ek3mBG5z1g6KykONxvVJOx8h/PsYwLdQCsljx7ZfY9pUSeVCRuK3k/5vAKVtK/0v8GyuILGvzNkZeA9tTln6Zt6yHhlmlDvTgXA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fWHYZ4Pd7fD4EtErwJaz9z7hdAb7Pdo+VEj++8mEEz8zyAra82TPqaneXMDOq+eu9hkivspT/bWfAH0jiy159v7zf+Tu8wg3k44M2TePH2bgglhvHmq5IfiMwcLeYXx97EkWur1iulMoQk2pJSL5RjYqHip4Tki3ylNUL6iOuFUfyG3pBz5kPF0sAQ9rOxuKQJ87vD5KPje/F72x2aFfGEW85EgkuPzNjpbxKfTi46YAM+RoeJ2mRlc7mac2MeyUxawhTYtHu/BDzxURuYjyfPM8hIUhSWOKgM7wcH0NMUAUGfFPHLMyt/uE+XAO1hP0MJ3xCPaw+XDYzN/OB8hSes6OY0cWrTIS+6xv395CUJH5urlaDZzdKQDU1+wRRB9mXBcJnO5teKbF0dzw5BacZWU4aAZdrLwOiMA5ePkClRm</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JdKjIJNJa7poYPFTe8LQkWoARC4EyupJd2IHZ444sBOVChGdY6eLD9fEKIAOy+yCn7vUz1Glrn6f7wmm2pywPgZkWh/HCcKcLRDbJYRAQKKf6EHH8Cpt9kBMYzmErGtynq2hWbuYbff+Jy0OOkiumRagXeBfrQbTSZ/7gBwnuHj+PQTol2wOYiOol74t9XS428d+d3zos0sNjuO1WXGxUH+B0syYBd7idKiusK0zItiPU1gyazai3I/laIAwzDjph7IY3MEYNF6KU77+Ng7bnlWcf+5Wv/60G6tweCXpGk5BxtfaM4qHV9l41p7azrJSM1GZk1pdIfmPaQZMrnGSJO+zGGLJsIwy9l/ybPQJzpJ37l6/+pqjs7tgUC4fCUnlbaXETRuM3OSPKWd+Jfg3TUyIh4FZPOZT53pkCuezSxf63SOScCBnMjPPpNS/9QLAPc8ekBBHa+Do75WCwgn4iwTp+XtojqqG1MZSLiNY1VGBRTVLQAiB73EfcS0k45Kzg==</encrypted>]]>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OIggWVGzNmA2KCDDBmloMMt1ISwZiL/FtoxFkymxJPGhhwQ+4j7IQnC4OaFAdY11lmZMOwPWDBtqxMHFJ1bFUvgCGCnLYC2eVdT+EDTX639ZLjjIOvDN1uVnMq449DzWLWrQcschAt15y4el9q3lirv+G2WkmZinAj37f3dXLVw04WLaGBak+E2GvM0EgH3W0/Mya64UwTeerzpcDluqCL4mTVvWUS/Aeu9QS0DZ6djtg68lnlo74HTPsQGzPCCRwqX+mQuOARz9Le56Fz3kmswD1Uc3085ddgyuHKgfPdEWu/QbjXBjBpR9QSg/TlqPxpC65cPjvyM+scyfm/sfbS2NKPhDdwltoHzGv6o2ISPWCvQ7b/ak97B9AgH6soY9L914qYj2vFnbDbpMvrguzOAW0qFtZmhrTAjPK30s8E7wyr8k/1qudMTg9KtZLgO5A99KAzAFFRJRUy2kT8CiZ1mT+KAZdhA4TB6LGXHcY+A3ty8BV1DnaXMTM1wgJnDlhDMzmVb0WY1aZLuS4tdW/BiErw0HVsuNSbjZlulA63joxm2wsESzmMkMKbpk5NyL3XRhTs3NW2ooYyUiqe5GKxcN9AvIy78HY04rlPGZdEkR5bVs5Dtx5t4SNyPytxxSEE13rZx0lopHgrrQ+Y/0LxWJagt0mBeviPeZ8jCb8oQed4AOjvck5fnaCD1RBe2LITeWaiXMl8znWT6InM5NXGzzkojprUl8zssKztxJk3NHreXMbvJQiJp7sSWYrzzyzWvNFD+W6P1ph4BWR7hAEv/8zGHpcqsU/98AZwSzwdn0Nt6hT5DwtDdJ4bhmwR4ZXdibJzYuBJ0OmE4XbRUR4OoENOcDEiLz5itQcX4J92GpfsjTRefNzPWSRSEXPAS2WzgSB/xaIrxNwMhJBKZoy5g+Saw8m4Vk/8gPZeB2xth/ScaH3kHOlHZQEHrG5G4Ph3EWubKQ6axLe8crQ+He64s3DpVWiV7D8ZEoFfM6aXH4UQA9QgcPbwQYl/dckqvxL744vMCKJWKBd5U4b27ods66qEiaby/EL5eVZgEIxbXRIbDuHrl1J6ag0089xqs807Mj/RrGNUqjFdBwa7gYXiSqi6D5d8msicx+XqCr+89</encrypted>]]>

    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqntNnUgeUpd5+2P86AipOFoZSSHVe9urXHKUF/tsb9a1bHf1v1kzRmNDC2eF4q8BKedY2QuUXfdGIsemNl8iSAdxAYm8krMjSesAqnfl7LUlwkSUQkePR0LhnLkaTPbMQOoyWpl2MARvrBYm77qQTlRXlwIlXhPSQ0kD74GppC07OQ=</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5/zEaQY7o9LGxYqVG21sdEhfxwdKrfP8l+ELyFgnTYr3P0ZY3Nk2xcxjnJLToRqQN</encrypted>]]>
    </text>
  </css>
</dir>