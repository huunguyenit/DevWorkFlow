<?xml version="1.0" encoding="utf-8"?>

<dir table="vsysStatusRight2" code="user_id, ma_ct, status_id" order="name, ma_ct, status_id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giới hạn quyền truy cập cho các trạng thái của chứng từ" e="Limit Access Right to Voucher Statuses"></title>
  <fields>
    <field name="user_id" type="Decimal" isPrimaryKey="true" readOnly="true" allowNulls="false" inactivate="false" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="admin = 0 and status = '1'" check="admin = 0" information="name$vsysuserinfo.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZeU3jfU/p/SNItQ2lPiZfX6XQV1mfoEoyxMs3aQQiXxLI3KoZRRwGoBPmYlUGitv8Q==</encrypted>]]></clientScript>
    </field>
    <field name="comment%l" external="true" defaultValue="''" readOnly="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Chứng từ" e="Voucher"></header>
      <items style="AutoComplete" reference="ten_ct%l" controller="Voucher" key="wedition &lt;&gt; '9' and voucher_yn = 1 and status = '1'" check="wedition &lt;&gt; '9' and voucher_yn = 1" information="ma_ct$dmct.ten_ct%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZRBf+OyfxEVrUf1k/7hCp6kQDR11H23AVQwk6/rUfOZLAsYHU13lZocHJpMDRojDcQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="status_id" isPrimaryKey="true" allowNulls="false">
      <header v="Trạng thái" e="Status"></header>
      <items style="AutoComplete" reference="statusname%l" controller="VoucherStatus" key="status &lt;&gt; '0' and status &lt;&gt; '9' and ma_ct = '{$%c[ma_ct]}'" check="ma_ct = '{$%c[ma_ct]}'" information="status$dmttct.statusname%l"/>
    </field>
    <field name="statusname%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="r_edit" type="Boolean" clientDefault="Default">
      <header v="Không sửa" e="No Edit"></header>
      <items style="CheckBox"/>
    </field>
    <field name="r_del" type="Boolean" clientDefault="Default">
      <header v="Không xóa" e="No Delete"></header>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330, 0"/>
      <item value="11011: [name].Label, [name], [comment%l], [user_id]"/>
      <item value="1101: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="1101: [status_id].Label, [status_id], [statusname%l]"/>
      <item value="11: [r_edit].Label, [r_edit]"/>
      <item value="11: [r_del].Label, [r_del]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwetFxBFoPILuYbQazwN5csi0XC1K5j49FHaCbA4FpNPToAH+b508mYSbfzhjTD2c2g=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYIOW0va7K8ykdWiLPjhxhG0UPpwRsnLerR1fNsKWPk03tXgSi0EHzVmgB+Oz8F+pUo=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulirVqVLXCyQjkX5iO+0awC7BKZD/Ezd+rsc5sNUbHklMyhIMy3fld8P9dcyc0mKc+W52Md7bI8Tz5bejAwY6ZnrALhRM4T/PjC5FY/T5g1eUNQO+q6qeiH4q/0WunwtTEvx9qIxFgVkuaFoXns7rd23ukweKwoi/yle9d5+GHeaKg5741Q9wz7JymHQFr3+/h6aUGTXc6g41mON+aR27mrsGvx2qN+Girio06E20nxF2gXlolhVbNCgCALE4pxs33LRhf6opmNCXZ6a71MbMfp6uuqFhQpgh1+tuHPyXmAj2tpiVNcbvEAwuVKliFvX5v4wuedUBL4KAlK+FQiCQuFzDOx8QSAgLSeV7b+/6LY1e2bAvUAJo7wKQRlU7lfUuUzzfxBSxDdMF2uV/s2oVNFZAyu9mgFY7g38gpOC9YvXD0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IvX/G4LebO9bpwHTheOHYE3B31fNJlU2Vp5KU2NB50+uk/q7E2TrTrLPen+VBgIEdapeuEYL0FVLnyt05ng4T2iLz1zECbZlVHfqmbzhuQ/F4yAz9yMOBFcfrqsmDn4iKYH1NSpvxLRnUDX8r7P1LdFUaWgise6c1p3fNkqErTV055TbixpzAzoilvYsfIVdh+lwHTnCJdrn7DGMUysijMzMbAsi8qeaQzlpdSjiODqBuaZ2dT/Htbnwf8NqSZ3RYz8Oym3rF7POM6W+vbjA3WIPrTlgHK1PndQMM/vwBkpBLqeD2aqMm/beKuR+r74ex9jfZr9GGR5whH7DMzuag6VD7icdfK79NHGHy2q1w617P/FF2NQ+WNu3DZIRSTpLVurqySFlJms+2HtPT5deV2NWN2Fjur3J50yuLAVLIcYkVSqEYfSNQnYML0HGbM0VB/Bi0vQpFyeVc/4FOOO8X6Z/7pKawYXa2UTSPjyvRkmIzYbFEfF9X7HtPNdEJIlqti6pVgdeNHZDGHmb5s7RFedMDK8gz6xc1+OBy7IP5vFtEbzqifQ5k5+5Y5n6JIMZVE3g33sXhnwap07593SGXNl83zZyA+e5MKwK4QPt8/ePg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FIbnIBvcPJdeg7CGPVF1Lc=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBrqLY13GAghsnGzziHFI5TPzMHbO9ft5tzo7W509lBW53q3xWeWyqfprRr9aSTZGACLaQG3zF70RUf+7WQKTBg6mlxF+44mHPbjPy1fRuFxQQx2K+lkISyv5EzjxqGj9IAaXFVuQuGb+q0XIbFJwm05NMKJDfFOwFmOS0qK9VlhhKY/Uk8lKLsgPN12n39wVrG7S8EzlbrZ90uLlcQA0vD0jPKxkpZL0XHn9lMzS8/oxvTQQVwJp42Unf11APxRjVpJzGTs+IYUjFgVly4lhc3X5zr9F+/z4zOVlZ5+hVpuQLUD6c8VnP3romFVb/DcsLAnEMvY5iFDW4Y1g5XGlARtsPErVoBQRRYu2egLBfMuOhghfOzHYUG83uthXmZ1I3FDSE+ekq/w1dckF05RUyfAbOJxT38rabRj6a2yVgXzmqd/jRmrOquw31LX7vFea0xti+CDA9+kPJBlAGw4ZisV+yltara8e+O8oFMErAdLqZsRiAVo/CVffqooPsnejjBvJy5Wdnb6LnZgLSoAx6qocZLz1LoFazvzko+dVq3u9hF8F6nBwTMdKGkpdBHRnmtcnG1EqEnXOS48u5PhSvcZjllXKlpS5pHwpjNyZVK6tPSNKVD+/bFJYgy620yQ2xI=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FIbnIBvcPJdeg7CGPVF1Lc=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IvX/G4LebO9bpwHTheOHYE3B31fNJlU2Vp5KU2NB50+uk/q7E2TrTrLPen+VBgIEdapeuEYL0FVLnyt05ng4T2iLz1zECbZlVHfqmbzhuQ/Fy2E3G9rVfZdkP4JG3mv2ml9d9TzfC38eEaeh7aNXYe6DclCPgVgclCDknb/iw7JOAg3Em32Wx32usbGzvV+CsACtc+UF56Wbz1qNy+Kch6GO7N8s8QdLbw7Iv3ZjKgI/ymjLJVpKKPYi93vAgBblH9UnOMNjbUzBQ9nDET6iaeOHBwqarrVzP34e0XOqEEsUZDqyNWpQVxCnTGY34oQmPEdsnW8o+bNOhwFIydbZvAc8jm5SqxZ6zv65BW1nQszV7oPapoe/OI5IL4kukfYRtNQ1LgDa+pL4YocgAD14XxNgJBrmT46wrmsBdCDLoaLmchy2CMMQHdu1FRFuDej9inhdHr4+/yIOkqosZwKrcVO</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FIbnIBvcPJdeg7CGPVF1Lc=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZpbOOxDL+f+35TUmms0aB/AkxRh+AsNHDOPZh4aYr6QHGrk996tzixZQT+xjcgX3+Xv61O+/YsqqQg4xadhg6s7U6CVPUwHJSIQYdYDBL3KvaxhEFsxPyUy3wZ9E95AlO2+zirfuPQ5hCs4SWS3zcZxJIFsMrNaYIDONGzb3UK8gzWke90FlXd02iw0lxOSR079x3und2x/9uNNKH7Cx3clpKv1gfT+qqF8x9b8glOyPpA6KrjlrTReL5lcHdXEB+py8+iZBi4BPC4qvP+mkiycUYuCdCMph0YgGDoq52ZYCstyz3nVFHbIYIryXYuX5rpl9PxrtcP7vgh3Kzv0fBNGjxf9q7sKJBrdxRRYJNetRuVSRVMCkVuaAWNm235PnY1BI+lfsgMUgFQbl72mYSPVlUmAS48una+ACfQNd9J8sAFS7inxcyI/ZJ+W8e++jGJszCt9Crh4LpRsC4uS3ZJsRaiC5dg0pk0+Zf2O11jgNpSL9fJ3Omwb4f0x9nvzyBuHtmyD7GpVJpt0Kh5mduC/CtTdd78lRbMHTfYJrTLr/hhGN7/LD1UYwhdjmuDqYdQOMNSN1s2hzPvWgRaMnOAnMFbF9yAzWtalBQZEwQvKtb4SybIi489fug5v/+8bgI5LiPCt/qGwiqkvbxmiSx0</encrypted>]]>
    </text>
  </script>


  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqntNnUgeUpd5+2P86AipOFoZSSHVe9urXHKUF/tsb9a1bGgYRO7OuPWdLVkpBqla6LwgniCwAk6ZD+cmxwzyqLHtgJFRbfc+DGYAkJzKx3Qn5U=</encrypted>]]>
      </text>
    </action>

  </response>
</dir>