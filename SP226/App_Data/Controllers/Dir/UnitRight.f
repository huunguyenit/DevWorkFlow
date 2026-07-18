<?xml version="1.0" encoding="utf-8"?>

<dir table="sysunitrights2" code="ma_dvcs, user_id" order="ma_dvcs, user_id" xmlns="urn:schemas-fast-com:data-dir">
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
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd%l" key="id in (select distinct id from @@appDatabaseName..vsysunitrights where dbo.ff_ExactInlist(name, (select restrict_users from userinfo2 where id = @@userID and restrict_yn = '1')) = 1 and id not in (select id from @@appDatabaseName..vsysunitrights where ma_dvcs = '{$%c[ma_dvcs]}'))" check="id in (select distinct id from @@appDatabaseName..vsysunitrights where dbo.ff_ExactInlist(name, (select restrict_users from userinfo2 where id = @@userID and restrict_yn = '1')) = 1 and id not in (select id from @@appDatabaseName..vsysunitrights where ma_dvcs = '{$%c[ma_dvcs]}'))" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZanEDc3gIxTrzFitSBsc2wJY90WUG5d1vWFVRY/dF361CqAYHsJkPM18AAUSQnxviA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="name2" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true" filterSource="Optional">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd2%l" key="id in (select distinct id from userinfo2 where id not in (select id from @@appDatabaseName..vsysunitrights where ma_dvcs = '{$%c[ma_dvcs]}'))" check="id in (select distinct id from userinfo2 where id not in (select id from @@appDatabaseName..vsysunitrights where ma_dvcs = '{$%c[ma_dvcs]}'))" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZTT1uwSpKzCFVCE+DyokzhCphW+a5NZexxv/TJUBdCzM0J8uVFS/3KYpyC5tRa+rUg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd2%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true" readOnly="true" allowContain="true">
      <items style="Numeric"></items>
    </field>
    <field name="r_new" type="Boolean" categoryIndex="1">
      <header v="Mới" e="New"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Chức năng&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Function&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="r_edit" type="Boolean" categoryIndex="1">
      <header v="Sửa" e="Edit"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Cho phép&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Allow&lt;/div&gt;"></footer>
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

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAMhjeAZ+LFVbbQYGsDGqojEpcgN1pPW5jYBZfyGlVRX/iBCEBvqZJVaAvXXVlmAZeUkthtH6ZVkvtXDtn6rwO5V9Eev3GHFD20ttLjIY8zjjPUXv15y2gbOFEBLMg8yeQaQp8UfTL/Kt5ny6KInxwIRpxn0DV9gVATGc+fr/OaOee0SB38daSW/lUN4wkV/4FNwf2Gi3exYCCAkL3lqk3LT2hfDnPgfFl6Tt4D652pvcM0bHB1e8TsA5+zJcZA8u2z3WkYptRqm8IzQMpMnWSxDw8J47CcoqMlkUuISBKCxQ=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwNOU1pF8/FMdcLvEvIEvxhW/mLhbXSJvEnIrTjj4zKAuuaN87uMbF9+mnt3qkcxb8qqLH5rpVdCRcBe/6dRGG1KCth/ac7JLmLuw+wy/xThROo6sXCeR9rE2JgZeXxvJ0aska63URxs25Oh7a5Day6q1swSm3gF2eVSWc1f7s+JgPU82QYAHGBYI6YUBew92urDYeMmFhm5A1iF5S2DhzcKcqmQvnM9WF/ZN3kxk/KderipfJFR5bm/94UxXUGSSnAkFmJbH+sG7FIfkIMzeBaV29jXu93ek3mBG5z1g6KykONxvVJOx8h/PsYwLdQCsljx7ZfY9pUSeVCRuK3k/5vAKVtK/0v8GyuILGvzNkZeA9tTln6Zt6yHhlmlDvTgXA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jb473n4gZ638WmGveS2CtPbKmC6arKPRjyFnaWdGLhhqL5UWBeobeHDQ+HEtCQUJ85ZZwy1tiPA54MaCQVebQQ2SwMaWbMiErKkV8VpFKMag1GnBdc6Vx+W0WC8KRvzEMrOA/E9bI2qbu4ujm6wDXCQ/XhygaoHQVaVJlkWUhqGGAJj4sGOKEh2NV860b+lm2UhMNfGBr33IhLoyGMgO0jMbX/F8oJuZ18LfbICGHwfrZbOzp2DYpdmwqd89w3Lg/N3iF/P2pRm7xQppR7KtWqY3uThFnv+xLHvsTfrBWPnpCKB7Fbts3KkhIF0ndyOgSOz9K//ACD1rG48ZMz9QfN8kPnVoyLj4Ze/4WTIv/rMzmveOFw9B/2kUSLoxacdWPLCBDZZB8/d0D3pRS5ZFKZ7+st/W7JqhuC8xqcuN3t11A==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwNOU1pF8/FMdcLvEvIEvxhW/mLhbXSJvEnIrTjj4zKAuuaN87uMbF9+mnt3qkcxb8qqLH5rpVdCRcBe/6dRGG1KCth/ac7JLmLuw+wy/xThROo6sXCeR9rE2JgZeXxvJ0aska63URxs25Oh7a5Day6q1swSm3gF2eVSWc1f7s+JgPU82QYAHGBYI6YUBew92urDYeMmFhm5A1iF5S2DhzcKcqmQvnM9WF/ZN3kxk/KderipfJFR5bm/94UxXUGSSnAkFmJbH+sG7FIfkIMzeBaV29jXu93ek3mBG5z1g6KykONxvVJOx8h/PsYwLdQCsljx7ZfY9pUSeVCRuK3k/5vAKVtK/0v8GyuILGvzNkZeA9tTln6Zt6yHhlmlDvTgXA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jbs2FdypQSDwocVprPkCc89wWIEa6/oqBfB16pWMpZ46+GcvbPCgnOQMUp//tjS+8Zi8Ka+9YUyLeyNBPBHkCUzu2/YdfP8nRgzjnMtAJc7wN4jg9cYRs2cAWO2vPgrbM7ZvfiPEwlEhSSw7sdrl4wjZpEYMgh9TaVBe9ZIXB08deLGOcsynen53lm0Ayg4Go/GkuW3aCOcNNd7ubjreaieh72KMRhwiecctqIyoSWGxWYlZ7R+z5//oiqr3XedtIu90/L6BBwho2aYfS2kFLeyY75vkVBaoSWhtOi+mqCqMw==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OIggWVGzNmA2KCDDBmloMMt1ISwZiL/FtoxFkymxJPGhhwQ+4j7IQnC4OaFAdY11nfIeawdHsb3CarxJLAu9TtDL4Bj1CuvDeJc4BdIXqMbpcXalhxcWhOlEAZKAn4zXf5wVURqfpAlxg+q3DnkrKExtXured8CD654fpfHbOuawc27UcDwvyZr9dy20l9slRB1kfkpBJxBCsFaMPvJXTQOrcILq7dHWE3KI8oy7cn3tNoPat0TFZd22AzahT7dTm61PpYA5o3W59I6F9emsNgJmgUhqXUwrVKcpsserIBuDp75PsXO8fJd98kqT3kUU30QCJLX3oHPqKu4DQsyVxeD+Vq451w4kg81Q0iYIk2ikrHISBMuPZAHk+wWjtf6KhydF56A6tdfH8YA3KF9Oo+rF681b70YvxoBpaqakw5+JmeK31FC3AqcxnBd1So5IqSmejfaamY1jheBjXSU3G7i0VrlMasWXxZj1qI/f36oyrKWf7ripfgZY7j6ORy0MYAVi3Iq95dk0HHMkAEiqJbH8HUFsKz8nF/jxhb5Z2PRd+B+90rxqKSPqOnQckqdLkMdyTcKEi0w6WIrJh/KG/jfqfwXZqORxtn6y6vjY9bI1fru4Mad4RwDLsADukiyJKgcRi0HyPVr+/bQB9gvcYDq5DXZ72RdnCqVYGeeptITexP08me5USgYIhrl4QGxrhGhWCT8m7MkwBxWh0JCMD+TdQ6vQVbf1DSVFFKFhDAzEReN6I9a6BQlUId4domKsYeKhd9grReIA35OUxmdjg8N2KQJlRhd/UIYm24RUxHsFzLjY2vrUNKDua+M/9HZ8WgIz9R693imvaqFyghoQ73J/z+J2pIwwVujKiK78b5wNoTCoTyBhoZMQoqOz4JMaMIB8jRNq9Jmh8997yDClpZ5aagUbsZ9eYbbqVEcjQCLjM00w/bWt/10WRTmwE3+m/2pVeY2VcFWbA/XrSJ+a6hDePzThWOIrvyQE0ctbQhSLbpyys/5UrM4rVhyD3EcKRhJCnhmPXyAJ9Dj3w7ey2mfYtXr1zElLufWvA8YlkmHmqDkV8Xl1STHzS6+a7FOzGDMy9rm9W3fxpgAYy/h4MBbhdwYn/7mnVvKCfJXYKzB</encrypted>]]>
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