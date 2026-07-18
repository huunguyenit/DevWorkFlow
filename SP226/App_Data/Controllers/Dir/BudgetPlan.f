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
    declare @$lockedDate nvarchar(512)
    select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
    if exists(select 1 from dmdvcsks where ma_dvcs = @ma_dvcs and year(ngay_ks) >= @nam) begin
      select @message as script, @$lockedDate as message
      return
    end
  end
end
select @message as message
return">
]>


<dir table="ctns" code="nam, ma_dvcs, tk, ma_bp, ma_phi" order="nam, ma_dvcs, tk, ma_bp, ma_phi" xmlns="urn:schemas-fast-com:data-dir">
  <title v="dự toán ngân sách" e="Budget"></title>
  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" allowNulls="false" isPrimaryKey="true" clientDefault="Default" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" row="1" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false" isPrimaryKey="true">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true">
      <header v="Mã bộ phận" e="Department Code"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_phi" isPrimaryKey="true" categoryIndex="9">
      <header v="Mã phí" e="Expense Code"></header>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1" information="ma_phi$dmphi.ten_phi%l" new="Default"/>
    </field>
    <field name="ten_phi%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="tk_k_gt" categoryIndex="9">
      <header v="Tk không giảm trừ" e="Not Deduction Acct"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_k_gt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_k_gt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="no_co" dataFormatString="1, 2" allowNulls="false" clientDefault="1" categoryIndex="9">
      <header v="Nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Ns hàng năm" e="Annual Budget"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Ngoại tệ&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;FC&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt01" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Kỳ 01" e="Period 01"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien01" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;baseCurrencyID&quot; class=&quot;LabelDescription&quot;&gt;Hạch toán&lt;/div&gt;" e="&lt;div id=&quot;baseCurrencyID&quot; class=&quot;LabelDescription&quot;&gt;BC&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt02" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Kỳ 02" e="Period 02"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien02" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt03" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Kỳ 03" e="Period 03"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien03" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Kỳ 03" e="Period 03"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt04" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Kỳ 04" e="Period 04"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien04" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt05" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Kỳ 05" e="Period 05"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien05" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt06" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Kỳ 06" e="Period 06"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien06" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt07" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Kỳ 07" e="Period 07"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien07" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt08" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Kỳ 08" e="Period 08"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien08" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt09" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Kỳ 09" e="Period 09"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien09" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt10" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Kỳ 10" e="Period 10"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien10" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt11" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Kỳ 11" e="Period 11"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien11" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt12" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Kỳ 12" e="Period 12"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien12" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" disabled="true" categoryIndex="-1">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" disabled="true" categoryIndex="-1">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="10000: [tk].Description"/>
      <item value="11010: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="11010: [tk_k_gt].Label, [tk_k_gt], [ten_tk_k_gt%l]"/>
      <item value="11100: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="-1011: [tien].Description, [tien01].Description, [nam]"/>

      <item value="1101-: [tien_nt].Label, [tien_nt], [tien]"/>
      <item value="1101-: [tien_nt01].Label, [tien_nt01], [tien01]"/>
      <item value="1101-: [tien_nt02].Label, [tien_nt02], [tien02]"/>
      <item value="1101-: [tien_nt03].Label, [tien_nt03], [tien03]"/>

      <item value="1101-: [tien_nt04].Label, [tien_nt04], [tien04]"/>
      <item value="1101-: [tien_nt05].Label, [tien_nt05], [tien05]"/>
      <item value="1101-: [tien_nt06].Label, [tien_nt06], [tien06]"/>

      <item value="1101-: [tien_nt07].Label, [tien_nt07], [tien07]"/>
      <item value="1101-: [tien_nt08].Label, [tien_nt08], [tien08]"/>
      <item value="1101-: [tien_nt09].Label, [tien_nt09], [tien09]"/>

      <item value="1101-: [tien_nt10].Label, [tien_nt10], [tien10]"/>
      <item value="1101-: [tien_nt11].Label, [tien_nt11], [tien11]"/>
      <item value="1101-: [tien_nt12].Label, [tien_nt12], [tien12]"/>

      <item value="1101-: [t_tien_nt].Label, [t_tien_nt], [t_tien]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 230">
          <header v="Quý 1" e="Quarter 1"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 230">
          <header v="Quý 2" e="Quarter 2"/>
        </category>
        <category index="3" columns="120, 30, 70, 100, 230">
          <header v="Quý 3" e="Quarter 3"/>
        </category>
        <category index="4" columns="120, 30, 70, 100, 230">
          <header v="Quý 4" e="Quarter 4"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 230">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6c3Y3QB1EUG3FVuqjro7zqfOfZ2Gk21xZiUz33bsMZw0gr4df6zqyXF+11zKKbx8JvVgGlyzBM3MlPWSky2ehL0dtxmLZpwfthx8RrdnHzxl6Twayas3suTFbEIYbEL1yoIp5vef4XPmiwBPmqnYcd7/Gb9Cxs7NwtY15DLIjExPEugcttvMYn37V+MFwAWHnJHy0CrtJvonyy9fWQcZ6UI=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427Rdou7rbij1W55cpzU2s4UlFXzHSBYbk4laDHPQjprcPQF2fTth6QC9ICNGXfDAqzmu/EWSMyG4Vpr096pqvJUQFNExKQJFbbbGN2n47s6QyqzOfsmXtiNLdOj6lDNLKzO+oXsxqZeaq27wErAHfbmdd9Jz3Py/+hJX5k2Cu/FLEv1OWvW3qGVnM7w/MGIj9JwW7qLj1eycvS+zhlol7jMdBfvOfJ/+pWlNhe2Df3bHS0sk5Fqw3g+MmgljpdQ0g8NHgF</encrypted>]]>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/ctHaY8qb5AyIr0jPtbYV+v8gubl2byxPs9Az+jXPIIuWNDy59Yi1kfiziCEDX7TR7Noam3tgly5BiRnPTEJx1kHh4kRKK/EFTp5U3wfRw21JNw4acV27LvYuThgOVDQkXqODw+il/19xwLnfBiwG3Qh2hjTL7Tdbfqwuc+Wb71E2zxK9NRAU73N3UBOL7V9HDEko6bWQGwLq7QSelwqVLHktxnvMs6vc8YZP8qpoQRvIIhmXx8DJILfVoXKsqK/R/MA18KMgdfwXR4yL+7q7zLAn83SoFKV+qo37tgtj3vzSsVL+mt8m+B6s8+acQZXaO3OOp6nLLkOWdafQ0UJF+ufTXkLriAqQmR8DcSDX/6qfg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nFJssn+cBPm60rXisaJgw0t1zEzokqO4O05Veh9aLSHnPuLGyiq0UyCg6Wx79EW0e8Ym4XE0wJRxbhwQI3nJoNCmrpzLSiMgvebbxcuPnLl0MfssKoJ88ymphz9G4nG8IIm6E6PhhYar+iVQ0eBkVGmo6W+JjWvv5r/YCjWbtnxxJl0RboUyjWBJJHeRMKbWZkdiFzy+fZX/nJUzV812unQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE7kP2kikplDWg+IbwxCngMAOszCZtU98gE9KaN0SlzuTFlojTa0yRMcKkUrJ3mvnAriLO749s3tVgXBhX0mUnwzjwCVDc0Bl6h0cDdXRipcqcOEAyhQiu7Epk3h0po9pzx4qYPbv4bBri9rd+UpL0c5Wg8xLVUDiC9xl1LbV2zeonbn2OK+oAflpXTtx71ddpr67fBMeEg7rxYEoL+VSUE1UAZkxawlFgtvssN4LKS5U1AiX83lcJiR4ebKbYdCRgh6d1duf4LSmR1mxC93lqqeArgcGRjyYN93xZF8rbWLT</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev+SPD20ydJUl3KFBhnojPALGQYtc5fkJSUdQNlPKpN0oSXmwD76i6oFe8yVIixeayoTHCb0wPalxweRtUFyvPA=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFF88DTU2hhFgDUM0bkA2rvTjL4wqIf5fbw/9vcm5CLoY9duPQL6KvSDo8b5vdamyEXI7khTrowrkss4XrfnRnawtvhHLxDl10r//6Zlij0sw0K5i5JmZany97hf7RTjRJaasx0azsGsgfNIDK/If9RDDMraNdd+65mZ4H5hpddBW6P5VRSYfaaLoqsLLW60jRiBauwCQtYsQzzgsTMqSnJt3ecKzByPXZCuUnXypqWmImtAMkhHo9bLnHaFa9oYNt1dcmlvGVK/k5ZyPAwPtknN2jultos006Y8obDoSh0mZZxzL9KA871tT6DHVAuobwODPCWaaru5ds6mdFVXiUapyGR1mrxH2R92LSSpJuOodZEuZtQrP96fbCQTwZZnKkM</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Np0sFOmsenpE70+PvVmSSpO6gwfoN+5wMICOxjisrvdFwesuf+7/n8fG16w3R0x8WkgfLTfalciVnxYVT0fdOPuTAlxsWe2M2szW/cro2ZR8wpnEeXHm1rTtkM0nAARJQjdU0os3f4O/bLb9voSviN0KtkTlg/EpST6QiQLD+MMrXYEPjvU24DsB2DcKYl4j0bZk1ozBBssBK3qaTo0VUhwfCMNAAGFyFTLZ2kNrz0SeZ145XDSFNnWo5KBnIkqOQsbgmcdlb63k3ap5npBS3ABYjN8BbeEV0b/FXEnWllUjDrkxC8+04EdOggF3CcNWUBkGeaU7ySoqtJrfrMM3r/73u/CkiHYu52Phs5PlzyGj0FcoXnBqFem8JZSIRaJR2+GYebActlsPWPuCwWrmIzeqmHo0/ENeCmv9dTcDzb2hEwhkMlD2cf2cBgqZ55aQ3g5HHbfp3vHFHcXXHgAGimA8teUeAUa9HZ5Elgzan8pKuICqOIGYaCSEJfU6lorY9/MOl2Vxl2ZFrfsr/0jl7EFO1ionltXO2WuwzbnD5RcMKt1kZYtOTzocG2A9unsPJXlsgcURFEJdijxCKLxFHWyfw3lHJ6MnYoqL0dNYfa74nDLyl5bHMhpXb74mpblpTlz0K5oefzbJtvNF7J2ZxJsAg//jwJL3vnT0etl3BqLjt2V2hYB1mdRuSq5Anuj/3hpOKYLRFVZcUyXsYZxJd13AZZSdy8Dp1cHJcGQ0iMmw4kqmdrgN5sbYIMpPzYxtimP2QwGbyQ8z+wiE5rLdeWnLcUYTuyRn+BlXvzWwr/zylZmdnnrQCbOEgZ5OM6r0Hp/wOlZBFIH0E6VlkTXTmrm7zTy/LEiNb6IpR2HV2xnlDH3wVFFNFXtHBqhT6mAatA8+2sMIsm69Y9HvLg3EIhz+DSwctbrT/B90W1sTmjoBpV1zxoxs2LM5dxBi2n/ykjScL9ZATqiOECAcsplKZGOCJXtxKjyZ8zcuF2aa6ECT0wFyajgp2g1PdI6/KVi3zF45gjfbS0YClkVfUAEYz29aExuVVaGFR3Yk6CsToNaAyC0MIv6s75zq6SFhTj3h4AyVEmyQlOqCI7chMcnCsI=</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIaK/cC5r/EwiY1w5VaLvIwj2XYXDp2CaxJ/nr5QH5gw+zeaWNmfx/5sFmJkUQM0M4DiaPDe/1/zMFf3zJ77xb/Jn8J7ZYIF0IkVok5a+62w2cKnQV9/wYPOcE2JTmM31xA==</encrypted>]]>
    </text>
  </css>
</dir>