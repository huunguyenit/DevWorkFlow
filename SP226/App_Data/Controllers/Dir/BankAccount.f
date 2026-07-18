<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY WhenBankAccountBeforeEdit "
if @@view = 0 begin
  if @@action = 'Edit' begin
    if exists(select 1 from options where name = 'm_td_tknh_dv' and val = '1') begin
      if @@admin &lt;&gt; 1 begin
        if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_edit = 1) begin
          select @message as script, '$NotAuthorized' as message
          return
        end
      end
    end
  end
end
">
  <!ENTITY WhenBankAccountBeforeDelete "
if exists(select 1 from options where name = 'm_td_tknh_dv' and val = '1') begin    
  if @@admin &lt;&gt; 1 begin
    if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_del = 1) begin
      select '$NotAuthorized' as message
      return
    end
  end
end
">
]>

<dir table="dmtknh" code="ma_dvcs, tk" order="ma_dvcs, tk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tài khoản ngân hàng" e="Bank Account"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field  name="ten_tk%l" readOnly="true" defaultValue="''" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tknh" allowNulls="false">
      <header v="Tài khoản ngân hàng" e="Bank Account"></header>
    </field>

    <field name="ma_nh">
      <header v="Mã ngân hàng" e="Bank"></header>
      <items style="AutoComplete" controller="Bank" reference="ten_nh_ex%l" key="status = '1'" check="1=1" information="ma_nh$dmnh.ten_nh%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZaOt8hsVVYvFyYykR5N8qDZ5TdpZWlwz4prmoLiL2uAlKd6q/s61cviXCLFJPBINig==</encrypted>]]></clientScript>
    </field>
    <field  name="ten_nh_ex%l" readOnly="true" defaultValue="''" external="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ten_nh">
      <header v="Tên ngân hàng" e="Bank Name"></header>
    </field>
    <field name="ten_nh2">
      <header v="Tên khác" e="Other Name"/>
    </field>
    <field name="tinh_thanh">
      <header v="Tỉnh thành" e="City/Province"/>
    </field>
    <field name="phone">
      <header v="Điện thoại" e="Phone Number"/>
    </field>
    <field name="fax">
      <header v="Số gửi bản sao &lt;span class=&quot;LabelDescription&quot;&gt;(Fax)&lt;/span&gt;" e="Fax Number"></header>
    </field>
    <field name="chu_tk">
      <header v="Chủ tài khoản" e="Account Holder"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="270">
      <item value="120, 30, 70, 330, 0"/>
      <item value="1101: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1101: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1100: [tknh].Label, [tknh]"/>
      <item value="110-1: [ma_nh].Label, [ma_nh], [ten_nh_ex%l]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1100: [tinh_thanh].Label, [tinh_thanh]"/>
      <item value="110-: [phone].Label, [phone]"/>
      <item value="110-: [fax].Label, [fax]"/>

      <item value="1100: [chu_tk].Label, [chu_tk]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwN8offvJtuOzaz8KyG4btPUuKCdPUPsBuvdHV5qx4nlP68K+0AosalipxQ3X9uAMjFY3APlmUYSVa3L+gL0pWg=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427Rdou7rbij1W55cpzU2s4UlFXzHSBYbk4laDHPQjprcPQF2fTth6QC9ICNGXfDAqzmu/EWSMyG4Vpr096pqvJUQFNExKQJFbbbGN2n47s6QyqzOfsmXtiNLdOj6lDNLKzO+oXsxqZeaq27wErAHfbmdd9Jz3Py/+hJX5k2Cu/FLEv1OWvW3qGVnM7w/MGIj9JwW7qLj1eycvS+zhlol7jMdBfvL06ckfxrmA8JSQDU+cav5WZ2Q1Yj8Q6cHxLpyAt4OmsbLOt31AYnEAvxN96O+BjeQ==</encrypted>]]>&WhenBankAccountBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb1W+i4Yu2FYMddmulhaGEZi8CZa8f3DwdkQrDLhoRpXYwMJF+E4Cj1dbcfv3yeHFygrc42ttfIs79r3pY/FLRCQK/AzHoAQwjOFTBKB/zncQ==</encrypted>]]>&WhenBankAccountBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYbF9PZfH6+/1swYV+TGrJY+JpMjsHvGG5d9PX6jMU/GlFNAIF4eUQ5TNpaYrhfYlQs=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulisdn1gPaxIUXjDlGlcLxpQFkcW+nRLZyhTVRY8F0sHla+7hWtmSamLunoR6U2E0dV4Lw0DvrYNqc0bV39XoFHzZ+ZI2+tUb9uJLwf7pJvxGe2A/f5rrZafGTg+qHUk1dwpAKijocpCTDe9n6YVf4/TmJzAPieJc49IDfpTXArS03fygLRbczd7K9EPlElGWy8I24H6Fm+scZv9mNk40cloFwWWMED2QdZg80ItDKtLGBo2cIJxCvq/dipEKgbmaEyXnJvj4Tk6+os8FALEY8BrpR71Ig8YnihAnP8y7qkXVnwGQO6zyDtjFXpr+yTr1b/MdwzF4N6LwTdepnjgHkVmQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n3VsIeiPxFfgHyQNoV7iM3ylg2fm6qqZJYEjLfDyfV9BBGSn4GWkr5YWjOpXB3ybrB8R/jxY0q3yALF7PGXZrbV2EQ0j2raA1eidrGbiK1CqaTwGLxq33sS3+5wesUYrgpcRcYSBvr/S0zQJ3gPk7JFiU2vkCkFTN3iYdA1p5Fu9xUupz+2lx9O0/5gaM8qqfygAjqmdEbo+wVlVoyF2Jvw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j7sXV2An6Eo7qJJB45zOjHN9bmlKxZ5zPm9EVf8BH+p6fttjha6U/RVJp1madtT1ibsTs2+63Uuc8O1VahM0d/aAd0y9bAnj3ZW9JyFlK8XLWd/m+uO+S4oI6X4/UO+/0kvtGJUKu+CBOKvmhhCIp0vnc899Bf3JFd7XdCzOZm1nMM5lnWk4TgyFS1SIFnKdX1C5tdJag5z4zvUArs/bfBRevcqN1dXe4qnAffnTWVaH4kbmLbZ21jtR0b2LROyAJ2Roj1q+IYHER+GIlZKkC1g==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbelVb+TD67/nQ0glkvmLEMNV3FXIWVbxs78rB2iGWCr017/60frU/FPQXaixLcFDOGg==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &WhenBankAccountBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70F+SXr2tyLGktNDy7D5snBeykSnTRHV8GnkIHvDDYjqSRBfGSrH78eCQkwwouJKSMvHh6M5midcFdIt6PNlYbuNwUjtMevfmjG5Cuz1wG79ieLHRYh+WBtYRxPxWBJGFKSta9e4YwY0vL4JlEINFEfeM2OI8j8BBfxN7dd5NZfezCI06P/cWWW/I/vBxYzgtA9yavN5S5XHVet/JGX896KNeLCW/g0vWWGH4tcJGYkkZHDIFxE0eYNrrdkQjeK2X1KV+1ShiASoFfGz1Xp/BPTyBVngCQEM47GBIY8m67EFT9Mg13a5dKxRN+yDmY0glrMBrbSyhmNMYjpDVEXale0vQddeaW1DKqOK4MDyKAoyyllCe3k/qFjyxIs+SY1hWRNZZK7zePGfYWF68/Wgm5DO04nZw7rhVQ+Sy748lCiv57eZxkIi0pyGNgmqLJz34UrZUIGuyMCdSYKIWH8sf5LPkkQBpnEIE69OXBzJqrZn3+Mi15OOBXiHu4QYH1iUxRmyzpTUNO6W5vu7YOEKtwATNrjj38LNfoDS3RD9rE5zcnSx7QPiyhK5w5jhAyKF808e0G+XNXEg4rf8VoyjpqralLaYGZ5NK9VVJXLHHgQgu3eIZhcbZvlYQotAoD6WCpwbmR820FdyvUkXOdgnQF+f6B3xx3Y+52tGcXp2B7m78P/6eiyNkqtiGhE4C3Ckm8A6vU6hZAZZbCiFukYfVN6lT083EJkqqsR54UwcZy049rzIQS7NkC6oaUK1R05GYCq96Wg4zZP/dfgFtNoD+DroKIidufmy+EWpSAUsSiemHViTolF8ZGl+ZZjLN5A1m/FUxpq3oJNbc1aj2nroClScAjVQkaly07xxgJF7AtMW5FJoHonawJHPL/OnprYzZYj9h6ZhcyrNcmZdSJd2c2JZRyscr628sNLs0wlHGHQjUxb05cIF4abQkGnuzB7jWVQ==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="Bank">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5Qb+rmZdHKsmxa+/oEloHTgHw9aQwJHULuhqrQU64BpQFjFflORBrZ//YyYtT3Zh40KsgMa1ZVohhHbVupXQhgf+hYJrolFYu8B/EZqyk1zaInJ8cwnnsbc6w5jquG2JVUmRs+3xL1gOP3+pAAdLH9orBHrc5qQYT62zrHU0zjCw==</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6afkp2ROukT1C5E5nHT+IgoDT1J+NiFJzVGrTP/UkVixCBFQ8Ne7ZhbTwzfbFa/s5w==</encrypted>]]>
    </text>
  </css>
</dir>