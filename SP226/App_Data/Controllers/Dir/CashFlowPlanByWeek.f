<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Check "if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end
select @message as message
return">
  <!ENTITY k0 "nam = $nam.OldValue and ma_dvcs = $ma_dvcs.OldValue and ky = $ky.OldValue and ma_bp = $ma_bp.OldValue and ma_vv = $ma_vv.OldValue and ma_ct = $ma_ct.OldValue and lan = $lan.OldValue">
  <!ENTITY k1 "@nam = $nam.OldValue and @ma_dvcs = $ma_dvcs.OldValue and @ky = $ky.OldValue and @ma_vv = $ma_vv.OldValue and @ma_bp = $ma_bp.OldValue and @ma_ct = $ma_ct.OldValue and @lan = $lan.OldValue ">
  <!ENTITY k2 "nam = @nam and ma_dvcs = @ma_dvcs and ky = @ky and ma_bp = @ma_bp and ma_vv = @ma_vv and ma_ct = @ma_ct and lan = @lan">
]>

<dir table="khdttuan" code="nam, ky, ma_dvcs, ma_bp, ma_vv, ma_ct, lan" order="nam, ky, ma_dvcs, ma_bp, ma_vv, stt, ma_ct" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kế hoạch dòng tiền theo tuần" e="Cash Flow Planning by Week"></title>
  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdhKMyDcSZVXQLrMIZtUm+tMJyAizOnFubpPidvPgCF/AapbbrQaKLr6cArPOgwZjttMIvRY1aIIMkBE/30kaQc=</encrypted>]]></clientScript>
    </field>
    <field name="ma_dvcs" allowNulls="false" isPrimaryKey="true" clientDefault="Default" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" row="1" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" onDemand="true">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã chỉ tiêu" e="Article Code"></header>
      <items style="AutoComplete" controller="CashFlowArticles" reference="ten_ct%l" key="status = '1'" check="1 = 1" information="ma_ct$dmctdt.ten_ct%l"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="lan" type="Decimal" dataFormatString="#0" isPrimaryKey="true">
      <header v="Lần chỉnh sửa" e="Revision"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Kế hoạch kỳ" e="Planning"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Ngoại tệ&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;FC&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt01" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tuần 01" e="Period 01"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien01" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" >
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;baseCurrencyID&quot; class=&quot;LabelDescription&quot;&gt;Hạch toán&lt;/div&gt;" e="&lt;div id=&quot;baseCurrencyID&quot; class=&quot;LabelDescription&quot;&gt;BC&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt02" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tuần 02" e="Period 02"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien02" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt03" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tuần 03" e="Period 03"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien03" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tuần 03" e="Period 03"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt04" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tuần 04" e="Period 04"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien04" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_dk01" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Ngày dự kiến&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Planned Date&lt;/div&gt;"></footer>
    </field>
    <field name="ngay_dk02" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="" e=""></header>
    </field>
    <field name="ngay_dk03" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="" e=""></header>
    </field>
    <field name="ngay_dk04" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="" e=""></header>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101001: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [stt]"/>
      <item value="11----: [ky].Label, [ky]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="11----: [lan].Label, [lan]"/>
      <item value="-10111: [tien].Description, [tien01].Description, [ngay_dk01].Description, [nam]"/>
      <item value="1101--: [tien_nt].Label, [tien_nt], [tien]"/>
      <item value="11011-: [tien_nt01].Label, [tien_nt01], [tien01], [ngay_dk01]"/>
      <item value="11011-: [tien_nt02].Label, [tien_nt02], [tien02], [ngay_dk02]"/>
      <item value="11011-: [tien_nt03].Label, [tien_nt03], [tien03], [ngay_dk03]"/>
      <item value="11011-: [tien_nt04].Label, [tien_nt04], [tien04], [ngay_dk04]"/>
      <item value="1101--: [t_tien_nt].Label, [t_tien_nt], [t_tien]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6c3Y3QB1EUG3FVuqjro7zqfOfZ2Gk21xZiUz33bsMZw0gr4df6zqyXF+11zKKbx8JvVgGlyzBM3MlPWSky2ehL0dtxmLZpwfthx8RrdnHzxl6Twayas3suTFbEIYbEL1yruXxz/alC5lGCRZ+QO90NcTMnkFhvPOMTDMJn3G9QNb/hkBn6dGApQ0z4Dhvaz4KA==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRdq+JMvaYUwdjDYqWqhq2YonakGIb4Uv2/z2BxfD14sNMWXhk6bceaaWyz97ch5ly7bUhrQGBuWtx70Q+X4UmIOoNzpJvStMUxqAhTAn/p4CHWGVPkn814j+u5WXseReFyFxqqkKAtcISXIjd8b0+kocNgS0P8TjJkusfmDqgTmyTML5dQXpcEQWxfthyBCvjheyDIkiYvJzVyWX79DiqXc7RiNNqZgDGwWXfcB7wLnbfquoGjCdGt24n2J7G+r/70FFW0nuFP7y/buJeEO4z/J+iNdsUB3YlNKiEhT+Lm</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOKmqQ5J3SQ+XhwHfy1ImQqRBaEjwbyy6u/5+aG5gi5f7ZuVQHCfzgBT6jSFK1oOsS</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf17SB624yUQlLPN9Ubj+9HxP0fz4MjycPzxMWD43kFv1iXLAaQom9yfKaiLJNYQT2ffWnLPBn6soodgzhQ7SNeU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtaYFPjgdPakKVDpX9N6EC/KRWINbqPGsdnKlNM9fTD56sUDCw3nVbIvwCESKV3brDAKr7tiWKNRYtgiU1nDMZUuQ92lcH4e+AzCQ1vm67Yyfn8vk2aOYAdnyqfKPVRKMCzMgSBrM6vKxYqffamASQxQy7dUC5c5llbFn9qRfUTtg3BrLjvzqveixvrVNlYxv/jf7Z7FS5csMM8Rq0quZdkZ14n1LQzjZziQ3UxwVC85k2jNkhdlvNrRlLGkOb4Qbf0S35rb76O4HxA1NUA0+NUpgePXjox79vAWEvHeWxEdedDqBP3ckB4MHPL9RD7fa8uz9aIk1ObvWfD5H5ZnKkDiNbQTxS6P2xY43/iXnzbLjmXqU9OeSFizIZ84US3vKjjktyw7FWmcOw9+iN0zkBHo=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cIrpd6++aOhypo6XdVj/R2oE6dYNPGIB4bNntPO6KBvjS5FFDueCoGrku5Gea5cGXIWTQc5LLkPLraNK6xSCuhJ6BzEW0hMe5WVzRn3LGt7asRf+6XDN5cU4SiqVI78/5UlLRc1075xnstW5vvZ/3To=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHIfhvN/FgzGs7XWCpp4tNw==</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cIrpd6++aOhypo6XdVj/R2pO8DKFX5kCdMAs0570dE92uM/tKq//QHnp/BAsq+FqMB+w/00905OVbLOk0UgzGTaFTwjKxQBLAxto1B1XIT2HhZVdNFJ67g/bprDaV0ErDQ==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKoQJtNHhH+8h/W1kPNhTsIDaxsroQvhd+V2peMo7tSG+M=</encrypted>]]>&k0;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYYjEvtx/DFlhOX28kEpDPoc=</encrypted>]]>&k2;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYdX2bkvtVpvqS7eHmmxs9WJ8VTvBEk4VUWga1/zq8AEWcEJlOYNUg0xijj3tTAp6EIltRw2ctwJg6tBimKBmHJjhLFkqWxgnghhnqiLZE8jn</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k2;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FZ7Du3m7Rny2+OPmYoEles=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFF88DTU2hhFgDUM0bkA2rvTjL4wqIf5fbw/9vcm5CLoY9duPQL6KvSDo8b5vdamyEXCUz+bJYH1FkO0fVOHix7K9Sm4a74m9LCX+5ptz2gEDE=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Np0sFOmsenpE70+PvVmSSpO6gwfoN+5wMICOxjisrvdFwesuf+7/n8fG16w3R0x8WkgfLTfalciVnxYVT0fdOPuTAlxsWe2M2szW/cro2ZRiQx66ICvyVFxsxN3iqvyAzeHitzpkMsFc1OgXtMtCpF5KwOXysGqyHVf0wN3BnjUQZx1ORD8FAa7foX63Y6q8W/0oFWlJSaehDXcdB86sAyBCpWoiBDA0M9gvQgWFD2p3jumRrc3XKc2C8rGJkDTBaSmKkqbtfDkhhShG1S849E4vJgqiW5022vllgpfdP9ccIDid3xs27wGH7XUB0M+KaF0uc488OKfYqZykT6xWkKFSiDIYmLUPOP9WqXHA8UV4UPCFdgElCtI1iO+KRA2VDf3A/yqEQ6lgP6y+AbbQn1XmXCoO4+vonLZeS7GTwJAqVjk5Ntcoxod14+oUfK01LK6vBdG0+Taj4bHjpMn501x09r81aZ+ArC/JBdugpA9q/EdhRc8KsWj9dM0AAKBMAicE2hdFzLXIXZ3ycPpO4Mq67S/auuwJ3TWJtqBaI76nS+4/NSTiFAAzykmZH1IBIhx/N4B+wrCbNPkFYjPP7t0bgPlBX7YZFHElbV04R0CgX34GyOuWnTW6++KVw9zGBco17FK8e28TlYkQxRQ6pzpWDffpb0tlIbABeY0CuupaBPQx1xf9SuUKcm8Galgb0uGXZNogLokvyArFN58RTBOixWIxJgQAMUp8U6ZLk2vccbBi/PGHskI9N0QkrrOoxfLjEqzGO+nOvBieUv8etznSOKoNh+iT9AZzWjhvAS4Weu00odJf9964Lz6Away8dUewRTev3IKsUAP2oTc/jXmTUx3+KH1krja3EW94kYBxC70JbRf/B9xm3qBTU+LQutm+8W6mJgd3IamXjlLt16lZHiWopK5q3906J6NfxEaswXMRL4pJ+GLlKD1uoG3XWiKeXWyJ4EzkdQTlHnMpTiRns6T0/6c/7RfAFFi25SU3eXmw5xh8wu88N0VlEndD+yfb37TViePol1O5dapQ01OYZ5o+kEk3iXUp1J+Pk0S</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIaK/cC5r/EwiY1w5VaLvIwj2XYXDp2CaxJ/nr5QH5gw+zeaWNmfx/5sFmJkUQM0M4DiaPDe/1/zMFf3zJ77xb/Jn8J7ZYIF0IkVok5a+62w2cKnQV9/wYPOcE2JTmM31xA==</encrypted>]]>
    </text>
  </css>
</dir>