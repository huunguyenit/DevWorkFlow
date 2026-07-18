<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenInvoiceBeforeEdit SYSTEM "..\Include\Command\WhenInvoiceBeforeEdit.txt">
  <!ENTITY CommandWhenInvoiceBeforeDelete SYSTEM "..\Include\Command\WhenInvoiceBeforeDelete.txt">

  <!ENTITY CheckTaxCodeCondition "@ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY CheckTaxCodeTableQuerySelectWarning "select @$scriptConflict = @$scriptConflict + @$taxCodeInvalidConflict">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;
]>

<dir table="ctgt20" code="stt_rec" id="T02" order="ma_dvcs, ngay_ct, ngay_lct, ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn GTGT đầu ra" e="VAT Invoice Output"></title>
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
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" dataFormatString="@upperCaseFormat" align="right">
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

    <field name="ma_kh" dataFormatString="@upperCaseFormat" categoryIndex="1">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_v%l" key="kh_yn = '1' and status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
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
    <field name="ma_nt" dataFormatString="@upperCaseFormat" allowNulls="false" categoryIndex="1">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" categoryIndex="1">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tổng tiền ngoại tệ" e="Total FC Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
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
    <field name="thue_suat" type="Decimal" dataFormatString="#0.00" align="right" disabled="true" categoryIndex="1">
      <header v="Thuế suất" e="Tax Rate"></header>
      <footer v="%" e="%"></footer>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tiền thuế ngoại tệ" e="FC Tax Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_co" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" categoryIndex="1">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_co%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Tài khoản đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_du%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ten_kh2%l" readOnly="true" external="true" defaultValue="''" width="0" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" categoryIndex="9">
      <header v="Kho xuất" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = '{$%c[ma_dvcs]}' and status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" dataFormatString="@upperCaseFormat" categoryIndex="9">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_nvbh" dataFormatString="@upperCaseFormat" categoryIndex="9">
      <header v="Nhân viên bán" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2" onDemand="true" dataFormatString="@upperCaseFormat" inactivate="true" categoryIndex="9">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh2%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l"/>
      <handle key="[tab_yn]" field="tab_yn"/>
    </field>
    <field name="ghi_chu" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="280">
      <item value="120, 100, 120, 100, 110"/>
      <item value="11100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11111: [ngay_ct].Label, [ngay_ct], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="1111: [so_ct].Label, [so_ct], [so_seri].Label, [so_seri]"/>

      <item value="11100: [ma_mau_ct].Label, [ma_mau_ct], [ten_mau_ct%l]"/>"/>

      <item value="11100: [ma_kh].Label, [ma_kh], [ten_kh_v%l]"/>
      <item value="11000: [ten_kh].Label, [ten_kh]"/>
      <item value="11000: [dia_chi].Label, [dia_chi]"/>
      <item value="11000: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="11000: [ten_vt].Label, [ten_vt]"/>

      <item value="11111: [ma_nt].Label, [ma_nt], [ten_nt%l], [ty_gia].Label, [ty_gia]"/>
      <item value="11-11: [t_tien_nt2].Label, [t_tien_nt2], [t_tien2].Label, [t_tien2]"/>
      <item value="11111: [ma_thue].Label, [ma_thue], [ten_thue%l], [thue_suat].Label, [thue_suat]"/>
      <item value="11-11: [t_thue_nt].Label, [t_thue_nt], [t_thue].Label, [t_thue]"/>
      <item value="11100: [tk_thue_co].Label, [tk_thue_co], [ten_tk_thue_co%l]"/>
      <item value="11100: [tk_du].Label, [tk_du], [ten_tk_thue_du%l]"/>

      <item value="1110: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwPo5PFMHe7FYqat7jY5Bzxg1Ojtx8NhcqiSeSkQeF9/+p0UE6ySZ8xxiPQDZTaLzjf8nqwdopjfCxo0HwT6rdm/74ndScA8IarfklAZm2dQjSQa/9EpLseZgSaRfF/xo01utYjNGalBHYqtCQUAHO6Z3Q2GCwsgaoaMgf44brLBzJXWFLkNXQfmoKaIpZ73NI2ISucTeuwOzRJPXvnsvsvqQjwiFhtEITLL3jKAx5iBuHITFQQCjE0DgkCuKgP2H2UNWkYTxyqd12FmicJ5MAWltZhH9vR5iFL+mLAAkIyQiU8dB0X+ZjvhtZo+yL5ZxiP7NvbDT5eGXO00y2rhKINOwXXst5Cc03OlEk8Ovs0midlP6Nn5ZHfnf+UO0gPWaA==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlp8b21aG71Pz+WyKdihaUwg6ozCF0fQXqDD/v5fO2Zwxwxs1sUZPRHZ3e7tdzDX6GUAvd5TIF9ANnEmd1d2ColHbfN1137FTDu5nP02aqij7oCFfZelzREF27SA3fBrMMmztFGvvkAFel9LsXK6nDbg3gPrh2IobhbU5C7QpChFT3aoQ6J0EGSoiI+w3/8hywjyUCYE7s70fEr5q65enfr03e8MwY6m5U/eUR+AIFwjRCG6T8fU20XeiYj4MnAhKRUKBE5QB5Z2i9DG3B3FsnQ2P7Aea7epoXfQtt7xAC98tJ0rT/JDiaa1kSwUzzGdf06A6wVjaSPzanqPeV6vSYMUVyQ2cyuifQ2HClExcK0JfrLDxUCLo6v2UOfo0F0HXIg9x5dQ+VmAIgDY1A9R2C1IiptME70D9odkE/QTl/mmC1aH4FlQ0Wt7wtjN/Fil4ooO1N21eVshYsWHdg5eoJh3kAPY4Qz+oI5DTQLwJMOJfQEvZ3JLI6Z8NiqwJTCWM5hhqkydydl0OPFdoj/UCFx+s4NqYD2f+xDYgyOoH1jRDCiNgEio7ywH7tN0FoG55NV2KJWWVlVdRCuiILPoCRtmev9D7FOAu24ZWlDHfER5BYE37KUyvpNkh/nZm+m5MY=</Encrypted>]]>&CommandWhenInvoiceBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH1x7oMP/QrNocenNeW0cJRvAikcyarIpODmhu/kd7UJFfZvzT+mKg8592vDr90I6aq9STbdALNSoXmV2b6uX9b6kxItdKdQbQSvo9mEcp/lLRg55QgDg2eWFD7x6lH0faKYtknhQu+iCEswsTp1C5T8/wEM+eiKRouc7psSxFZlLKJZ6Aa8+YLrZ9I7LqlRvaOB6Xf071rTBynSBmPRYzRUojV9Lt6+BpTYwU+pf0BbFbS0ta/r9fSP1yjQg8Rxv6ubA69I8KLtzhQTbyRMqwnovugfuAVFgwOt8pfCpMm4O1BSdtHmczkaeKWJMH/CTv/dTMSAGGouvnNYnsWZJt3H9Xd79SvtKESC2F6t9zCoYY=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7C0jxTP8IRVKR6Q8exYwzyhtDHpCEsOZvd6k4lfYBvwkemF2uDXfhHynM6jEZOpSTeo64xDFHWPyYX00tEqYT4LK0vydmIWdJ/En/OEKFG8UA5qcPfEuytmyF3hIn6f9D82KEj3XYFhOq3wF/u5xJP/A==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwa5DGHgPqVixGAA2iPA9YYgfyTTMgJtGPYQJgrYRafcdhu033XfJlm+GOPocOniM/fWjkC8DXBk2QBUIWhY/3c=</Encrypted>]]>&CommandGetIdentityNumber;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFZcn60MjRBa6QaIo6gfLGUABcvod10eXH9I5G0tTt/hH/YArZYbI9857D/lTe9N2waWlqAetY2UD3Up7rQ44XI2mJ0YKzqtk2mPCEyxXBNmfUKIdCwGwtCV7nLy4HajAiMuKCOJlcoSWPiYQQn01mU=</Encrypted>]]>
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
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFZcn60MjRBa6QaIo6gfLGV1efCOP38zfSn699sQzXI2OvowTHBWyUnRc0TaAINJDDW7ke1sOdxLyvnGVv0OYU88pkeTvPIjwg4wTRyK8Y5e25sq7q1fDYzw6djVO1FA5n0YZPfQaVmFq9b6c3fqooU+W5qWauvtHHhP59bZPS1W</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtW/O2L6FozK0mC8DTvvZ+dmNTgUBhs3FPl1S0ogwCoEWmcNpo20LlacVhx/W1V9vICeirKQcoIyj2Lwv++1gtY837mdDYuC15DmTelailpX9cQbbHDaq0p66MbcFazaDIRA4ddigRyTFxyFg2Q/Tu3cCGY6OkziheKvDBuFJpYDN+PDtb80rIKlDr1ysQi2Ki/i6PdSLBJu3/cJiYImm2CdPB3AQ7LdUvzqlMCPzjb04fkVyvw+MHXbDJgWFxl8ssvBOW4vXpop2RUx9V3StqWG8ZNGzafeF/jl6D5F0E5MMQsb4G0PLPEWXaPIuPiIc9oZgnsUpA4Nawk3MgBBm2Sv4jVaZwBFbV6P1VKj+WTb9GWPYhjxAXtQTly5zUMEB8e8pfU0nF+TRyjtmvU8Rp0dBdj05YSvdiOcRth/txVpNELIRyLbcdviP3uj62AdCNfLWtI6awDa0OjTVzalAPZQVjXVCfUkEuTK6hN6UJrtRMSoGXjaF5o6Fff5YrAMGewo2yI6wBreqgyB6y/iovV/sbFJ7XFo2YvZlig7LZ923jGi1iMTBMKyK5AJXFGkg+MgFeEwobSHuvTer/nZCBReoCSv9gnPrPteCWjSgdXWWRDQfTK0DTBMBRpRPWmpYDHb0gA/yFTP+1EU9h8U0KB8JuZsYeiaAahkdrBZQO2DgfpAg+CsFY5rhffT2uXJ4GqqDUnc+KJLVh1GjzLbdVUXB1jjpTRVSpoGMGZsIG/HENDOpnlJfJHC4OdmdGZxVy+kFFnUP937ilw8dRHdLqZVc0qk2aSDmTQFhRLDySPkbYVqQgwNxLrCx2jcqXWcO8dNbdONxfFNA+0ThPpSad3a+xZsWjVV4w4MBkfeAPuEfnS1szpK7dBup2NSop3eDuH8IYaUlVPYpSTMU3W3jOncednwi8FJzT1J6pw67QEE7sef7GcSXMa3si4SfNSh8O9HonaBjEOxIub4BoL1SFzBpFxlANIOXljuS/9I9mOSVXIqJ+aq2dat+EwOvhvRaNYW7ZAaKMEJq5JtrCi55Ah2uYuhYoJ/hyDBXi5Yw4DIDhoA3f8E2qrNvD76wa3I4gYG94n/8DweAjsjUo/nTE1OE8hatZ6F0XVsgjD0GmKaseJS3AnORlsmbdx5UqCZK91nIF0vFxWPb98ZlxRRY0W2l/PMDRncB8dSTBDVXU2KXnqu9DnSOxE1XViZem9VDohndJhwCaVWKbXn8sYO9dCLmdgYC1ypJTn47W6X+vQG9TXpXzImaXou2T1H+CANSZxKa08CIUExb81UATMuri1eJVYaFTUOErJI8ZIOuyABWRfX3UJy3DCkn9syJDR8qUw==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqa+ujzyTYkv+4oKDKj0hrvpowOD/VCgezE5DldwGfIgJKHrE3SnNQZMtwMrJHVSJ9xXIUotpV5tu07VwWGnPVxmceB3+ut1s5KDZVhs2kpxLDw6uoIoDqTNDkLPqgNA6vdOhxG6sjcTD91iRqWJ/frsA==</Encrypted>]]>
      </text>
    </action>

    <action id="GetTaxRate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yF3Gy7ptq9lBOeV/ACdzZ8tB95WCEl5uyRBdqyPBovkSSZu77bzI9nhCrqwdmc2Qq0MRXfS05TfTf6zICFOI31AMHA33sWyjX+4FCBlS1joWC85xU0acVHl6qhdxS/3APfqOPFSV6UCxDJKuLoHusJaM=</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>