<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenInvoiceBeforeEdit SYSTEM "..\Include\Command\WhenInvoiceBeforeEdit.txt">
  <!ENTITY CommandWhenInvoiceBeforeDelete SYSTEM "..\Include\Command\WhenInvoiceBeforeDelete.txt">

  <!ENTITY CheckGeneralInputVATCondition "">
  <!ENTITY CommandCheckGeneralInputVATInvoiceBeginTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceBeginTag.txt">
  <!ENTITY CommandCheckGeneralInputVATInvoiceSelect "select @verify$InputVAT$Field = 'so_ct0', @verify$InputVAT$Invoice = @so_ct0, @verify$InputVAT$Date = @ngay_ct0, @verify$InputVAT$Code = @ma_so_thue, @verify$InputVAT$Serial = @so_seri0">
  <!ENTITY CommandCheckGeneralInputVATInvoiceEndTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceEndTag.txt">

  <!ENTITY CommandCheckGeneralInputVATInvoice "
    &CommandCheckGeneralInputVATInvoiceBeginTag;
    &CommandCheckGeneralInputVATInvoiceSelect;
    &CommandCheckGeneralInputVATInvoiceEndTag;">

  <!ENTITY DefaultReportForm "3">

  <!ENTITY CheckTaxCodeCondition "@ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY CheckTaxCodeTableQuerySelectWarning "select @$scriptConflict = @$scriptConflict + @$taxCodeInvalidConflict">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;
]>

<dir table="ctgt30" code="stt_rec" id="T03" order="ma_dvcs, ngay_ct, ngay_ct0, ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn GTGT đầu vào" e="VAT Invoice Input"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l" row="1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <footer v="Số hđ, ký hiệu" e="Number, Series"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Series"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_mau_ct" clientDefault="Default" inactivate="true">
      <header v="Mẫu hóa đơn" e="Invoice Form"></header>
      <items style="AutoComplete" controller="VoucherTemplate" reference="ten_mau_ct%l" key="status = '1'" check="1 = 1" information="ma_mau_ct$dmmauct.ten_mau_ct%l"/>
    </field>
    <field name="ten_mau_ct%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc" clientDefault="Default" defaultValue="&DefaultReportForm;" allowNulls="false">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="VATForm" reference="ten_bc%l" key="status = '1'" check="1 = 1" information="mau_bc$dmmaubc3.ten_bc%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc" allowNulls="false">
      <header v="Mã tính chất" e="Tax Type"></header>
      <items style="AutoComplete" controller="TaxType" reference="ten_tc%l" key="status = '1'" check="1 = 1" information="ma_tc$v20dmtcthue.ten_tc%l"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh" dataFormatString="@upperCaseFormat" categoryIndex="1">
      <header v="Mã khách" e="Customer"></header>
      <footer v="Khách hàng" e="Customer"></footer>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_v%l" key="cc_yn =1 and status = '1'" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh_v%l" readOnly="true" external="true" defaultValue="''" allowNulls="false" hidden="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ten_kh" allowNulls="false" categoryIndex="1">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chi" categoryIndex="1">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" dataFormatString="@upperCaseFormat" categoryIndex="1">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>

    <field name="ten_vt" categoryIndex="1">
      <header v="Tên vật tư" e="Item"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" align="right" categoryIndex="1">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right" categoryIndex="1">
      <header v="Đơn giá" e="Unit Price"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right" categoryIndex="1">
      <header v="Tổng tiền" e="Total Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_thue" dataFormatString="@upperCaseFormat" allowNulls="false" categoryIndex="1">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right" disabled="true" categoryIndex="1">
      <header v="Thuế suất" e="Tax Rate"></header>
      <footer v="%" e="%"></footer>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_no" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" categoryIndex="1">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_no%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" dataFormatString="@upperCaseFormat" categoryIndex="1">
      <header v="Tài khoản đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_du%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" categoryIndex="9">
      <header v="Kho nhập" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = '{$%c[ma_dvcs]}' and status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''"  categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" dataFormatString="@upperCaseFormat"  categoryIndex="9">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2" onDemand="true" dataFormatString="@upperCaseFormat" inactivate="true" categoryIndex="9">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh2%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l"/>
    </field>
    <field name="ten_kh2%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="256">
      <item value="120, 100, 120, 100, 10, 100, 0"/>
      <item value="111000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11111: [ngay_ct].Label, [ngay_ct], [so_ct].Label, [so_ct], [stt_rec]"/>
      <item value="111110: [ngay_ct0].Label, [ngay_ct0], [so_ct0].Description, [so_ct0], [so_seri0]"/>

      <item value="111000: [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
      <item value="111000: [ma_tc].Label, [ma_tc], [ten_tc%l]"/>

      <item value="111000: [ma_mau_ct].Label, [ma_mau_ct], [ten_mau_ct%l]"/>

      <item value="11100: [ma_kh].Description, [ma_kh], [ten_kh]"/>
      <item value="11000: [dia_chi].Label, [dia_chi]"/>
      <item value="11000: [ma_so_thue].Label, [ma_so_thue]"/>

      <item value="11000: [ten_vt].Label, [ten_vt]"/>
      <item value="11-111: [so_luong].Label, [so_luong], [gia].Label, [gia], [ten_kh_v%l]"/>
      <item value="11: [t_tien].Label, [t_tien]"/>
      <item value="11111: [ma_thue].Label, [ma_thue], [ten_thue%l], [thue_suat].Label, [thue_suat]"/>

      <item value="11: [t_thue].Label, [t_thue]"/>
      <item value="11100: [tk_thue_no].Label, [tk_thue_no], [ten_tk_thue_no%l]"/>
      <item value="11100: [tk_du].Label, [tk_du], [ten_tk_thue_du%l]"/>

      <item value="1110: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1110: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1110: [ma_kh2].Label, [ma_kh2], [ten_kh2%l]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>

      <categories>
        <category index="1" columns="120, 100, 110, 120, 100, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="9" columns="120, 100, 100, 230">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwPo5PFMHe7FYqat7jY5Bzxg1Ojtx8NhcqiSeSkQeF9/+p0UE6ySZ8xxiPQDZTaLzjf8nqwdopjfCxo0HwT6rdm/74ndScA8IarfklAZm2dQXw7T6IQuG1uDBrJMeH67+RilUv2acpA9NDT0XqCj/KIgCxORgKi83nwc/+S7RScuQn3Qk/RTjnboCv7MvMAuSPXeaSw4GEonbNIh3UHH5UyxE6e4UURi5SW0jUH1PtLKG1VB3zCWVzoqfN/2IfiWQcYIMrTG4szXdh4HCcbUoQtmcGOvf8wF435ReahEhtp3+L68EEugFnz+yCV9U4dYz1ojTir6+iE6W2IcLVd/iYcQ3F/16yKx6WylH7HxE0zkLETTrLjI1VOyl/Pl7Ivlig==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlp8b21aG71Pz+WyKdihaUwg6ozCF0fQXqDD/v5fO2Zwxwxs1sUZPRHZ3e7tdzDX6FoX1ahzdXIn0Gl/BH8atuDrEU9bFOnuJhgW9ss9aPiYZ/MB9lw4efvmDzK4ZA5MYOwR2u5Ir5C/sAt9mALU6VbHnhm9BrU5KRmkLtYuBp4NKkaL2xg7bc+6zteM+wu7T1Mqtq0X7gWV3jn0cyLcyqsbNGc1BwLWUO0FVpLHF6OW6UeI6Kt0pS3yteIj27HVv0W78JfJikyw5TweY0mb1Fhx5OZBjPBCRlvYr/xNeLjJPT0zSRLBA889+4iFbW05cM972UhKplVS+EKa5s8+/z5</Encrypted>]]>&DefaultReportForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR786uZs2iSIdCJSXHVP/wsfu1f0UOxX1dIoCjSphfr0yenaWdFOx3yVvP0dC3oCwNqlYxzco4Vv9ZuVriPs0zMvHNL7PImkFfpQNZhTMOnJ6HEo6Bz1aLPdv8yyJmWQ988gDnwEQgLdqz/ybc3TvPTvqn3OBE6dqigREbLg/RRvtJAOu9frs12LIGy/bChUi6CSJqFBx1ZSI4at0ehdiB4OOhB5VsE3Tow+U4kab18Qo8H6LL0knqNmYSsaqt1A+HY0doh0i7KS2bAQHLVEPO08FHxeOG7uPn5M6V7X/YzaJ5aVN0bpZh/QV6LAjW8vEbHv/rvlenHRB5V33Ri3dUdsjbvINURu7fyzB+LRwphEHnLx+NdM0Ev+bjb0aOFODrKZhBYUKJpaP+B3gz/xbFvvglNPUgmvErAp5Mq8437PmOGB+Y/oq7NPSSZvLdR78MKOjhPfMVDhnX9brq2AbVV1PeyqJ0twg3mQLHtKm/AZZHdWyhzvDaH4po0hNi5qYcZhqyTJHm2GC7n+RRx8PGpNkDKb5VykssYMTnalaPxBbwJJPIPdhnkuarzTiASGEClw==</Encrypted>]]>&CommandWhenInvoiceBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ip8q90I8zRuwtf08V6MmRcgft5CyH4F3GhU7qMbReyutDRQwCwtYZn9xY6LzasFLl</Encrypted>]]>&CommandWhenInvoiceBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPRbB5mzzhVQxydv75n/Vm2lFkhV8N+l2A90R772qeVMSMgAV4P8UcTJcYa1OLzXOpVM4v/BUPa2a293+KogQ1s=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH1ITGTcrOmDtiJgLBEOOyk9aBlbLRjs3oZeOFwfrVMY7ZAOl6VVwTd2V/pYT3xFSpgp+ttyDG0FmlAIjTQ3fGix24vbhcylzYNkKzvxSzrG2qDv2Fa+lRD3JdeIpCCNl4N7stTJbFEyyq2tEzm0OyLOyWNa8n0C6p0W3vgLbuQLqcqHWp066o64tAP8Ccv3cQaBfRw0oW5pFqaBKmwzTUHtj2nxukMz5ywm+UYFOgko2+Zm7Ime7yNw5qGUHWKNCROhyrrFOhuRzG4fpNjpAJzsFLH4EFXlrEKaMvMFTHDZEc=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckTaxCodeBeforeSave;
        &CommandCheckGeneralInputVATInvoice;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwa5DGHgPqVixGAA2iPA9YYgfyTTMgJtGPYQJgrYRafcdhu033XfJlm+GOPocOniM/fWjkC8DXBk2QBUIWhY/3c=</Encrypted>]]>&CommandGetIdentityNumber;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcABCz+CaAX0lpfMh9FbWFFiYrWCd7qgbaPa+1VlsYbgKgbKEva7EIQaPPMB4n6Aaa22IKJzZdYAmgE8gtbZ2MhWXqz7n+EpxKUNcTbiu4Y+d</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &CommandListCheckTaxCodeWarningMessage;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0wwC+To+U3hJFkQDEkgMNaVxRVDarN56oMJe33BFsVNsn78i91f3K64WJT1iSYobUw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLcjmhGGXu/XkpYUdh2SZ8RGk4RQ3UOm1kMYMOg7Wvk8mPElSOU5NX/BGHjPFRnn3ua4qAIRtoVSGD2AjCdkABiUpp3dH9QtorDS6vAzw3bmc=</Encrypted>]]>
        &CommandCheckLockedDate;
        &CommandCheckGeneralInputVATInvoice;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV5FbOATP32DYe1E0CmbcSC7mUFvXCeC2B9Mu3c48YGeZ</Encrypted>]]>
        &CommandListCheckTaxCodeWarning;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenInvoiceBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptCheckTaxCode;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtW/O2L6FozK0mC8DTvvZ+dmNTgUBhs3FPl1S0ogwCoEWmcNpo20LlacVhx/W1V9vICeirKQcoIyj2Lwv++1gtY837mdDYuC15DmTelailpX9kvhHw6zfV/PkAsp6iVFApan5nll8jksYpg2wuEiyrfjHe22VWyy1k7uQ0hxRLIfaZ7AaJptp3wywlfOzZ/IRNFhpXI1dzxVxrWRa4m9Vng4dr3IdPr1PWG2isOE6OPV9ILINBHL2b/GRCetiLESa/z61JC8QoYzDdVVWqljUtw6GbTuYuCmmxzTEva+7VT+mxmD6ZTrwLsSl736Or1fC1/q344ikG+vuV8vqmY839EM+vauMeAKMY0FsijA5+zxbojEbkfDGe0eI5NoE4h0oB09KN7L2tJ/ZB0AZxxEV50BlnCX7pgRY0s/NuEQKqu08eOg+zLihkOGIE3C8INydDZ/ZWDBAyfg0BNcoAUG7nkL0wZu4vlGyvfx59x8X24Uwzkuv98hYh6RXpxt+oZGbMIoiRCvCCYwgS9mmKLE5ONuvAgMI8wDMBkJbsRq0qaAIeFptcsW+oOz1FD8qQJbiCPNeGzhuNq7tNml8r4zLX3ZbIffcbyYrxRay6arcIAoQyfZiacldbKpgUsdwGHjaksZjSpLpyh07S4CEejPVfhGFr4htZwEK1uvHa4Z6r6TilbvAWOjuBLeBoW8QqIgJESmIlM6K7K91vBl/vdVFkX3wDVxPQIRmCnHhEC1TK9Im/3QHawdNqwQBgF0zsep1QdrFf8n2pd/UKxyNHMnBmQSi61ylmj51QsMN/jJkr/iaEYyQ8jfiJ2H5EUkp+30NysEHPsl9Le2f2nYLFDCG5Ht2VAc69m4Xm9HSTsYbGSIKNd68y07dbaqnsr7Hiqc6H1F9osDJxLjSzd8VWJdJ9ws7gAN5eKjqLGszahcNCJPEfc8LkHPdG2SN2qk28dekDEFUv6go7Uhf5jw5MiDASNyWr+rxvpQuZgvmtJQnRSzzeqwDlkl6eXn8lvBzINnmaPdLn2JDoJo691qHb9Eh/nHs+JplqvmGCwxts2FRx344pQuFPjLbGsDDVtIqrUUaSse1jGL009i2/UiHPk6LFjY8hWSTJo3M/8kjMCiQiDUhQ8tp0fd4H1uRdrVxEBpdt9p9kdthobFIiYBdakyx9dQUnESkdiuvA/7Bu++1139s</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqaxtk81KWB7g2dSY6ulSogGkq4W7OP571jRmvm0/OLjKje0ZUAp6/zDrbxh3qtNAmY29nNnNpxh9K/azuCDc4sGXLd1s7J89z+Bf8xpTRTa3P6beYUomKqfYT+8es1C/ykYSyGjKZzTWXirhGOqrUZdw==</Encrypted>]]>
      </text>
    </action>

    <action id="GetTaxRate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yF3Gy7ptq9lBOeV/ACdzZ8tBqHX+c32IJZ9XaQWvopXalh2h6Gp5LhrOwxiOqJLCamq+9DL1Hd2N2cw8L8FFMD/P8sd02bimG6I/PvduW7yFFF9kPk1p9+0//8c3ntydKNSFk+IoAHmnzAcu31ClsVHw=</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>