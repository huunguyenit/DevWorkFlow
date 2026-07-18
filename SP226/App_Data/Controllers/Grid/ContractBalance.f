<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "ContractBalance">
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
  <!ENTITY % ContractBalanceCustomer SYSTEM "..\Include\ContractBalanceCustomer.ent">
  %ContractBalanceCustomer;

  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;
]>

<grid table="vcdhd" code="nam, ma_dvcs, tk, ma_hd&ContractBalanceCustomerCode;" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, tk, ma_hd&ContractBalanceCustomerCode;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào số dư đầu kỳ hợp đồng" e="Contract Opening Balance"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin: thêm, sửa, xóa..." e="&SubTitleBalance.e;Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden ="true" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" >
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_hd" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên hợp đồng" e="Description"></header>
    </field>
    &ContractBalanceCustomerGridField;
    <field name="du_no00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư nợ" e="Debit Balance"></header>
    </field>
    <field name="du_co00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư có" e="Credit Balance"></header>
    </field>
    <field name="du_no_nt00" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư nợ nt" e="FC Dr. Balance"></header>
    </field>
    <field name="du_co_nt00"  width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư có nt" e="FC Cr. Balance"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="ma_hd"/>
      <field name="ten_hd%l"/>
      &ContractBalanceCustomerGridView;
      <field name="du_no00"/>
      <field name="du_co00"/>
      <field name="du_no_nt00"/>
      <field name="du_co_nt00"/>
    </view>
  </views>

  <commands>
    &SubTitleBalanceShowing;
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOv/MZ08ZIci22aJp1jHdTPlAzRKwPT1ZiY7n2fTmld5jXWyUJFwP7GaZWYbA3EM6tOGBYZI0o6PdfstZEZGAHGWvRhuQ1PiFFAF//a+dVcS2InEScPBRgHIj832boDbwmF6SmrY9kZ4RwnKJSLhTN2lTrNcsj3AG70nacPh3+u+ni+X9g9kKdef2mQUBKRbxkx1Qe6udG2n62G4a6Ed6ps7o97jFJxXGWJ4aMbgbY8WsDfV1Hnw4pi+kJParowqXM7CF1AttEcUYSdXFBUq5cOzc9zBPegcl4J2C6NdELEWNlu4RVB6AEwE0TzSnFRGhgpl88Fbcjrr1JhSZFI+oHeEJdEPmFB23VozYBZd/HJlasXVi67ht+CnuLcTYcgxpNN2Wi/fafNTLqyxuqiKbnYFdWYtSlEfNkNQrdJcIYTgyZ7r+N564NF8CyBGeCxRbKBZpOTTvwe1Z8NI6cRgoBa1fkIB/WfXJKa4Yvzs2Z/8TUcrFORCpiV9WCJ7AADjWoeP8VedA3xdreBD8MtfJ5VD0sVV1/++enbc3CPpsT1HGJ701lMTzxeQamqgg19DiXhkiqF3gO2WkuAmMqQDkaLjsY9YJ7mfFBizMnZu3bwBmK00aJrqqXBt2TVxvL3zYwqQQyzaFXyKPbjjJlvc2Ol4yLcl4kCc9FnHFB3hPo4ZDCZkwCXgLp+P7ymftHRlrXg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NlhmTGP48AGmrPwcavCM4PmzVKQdJBugE4E6nhQrVfiMvTCemPjpN2VvYHNasyz9eFS0GIEL2O0myzO9D5o+8yS+0IRVET/1JJy6wcRfKGojRMiLymOtdlyfyAyWFRuTg3j5kkuGSEm22HUPRMWCXqTFgCb/z5ThQrpXsJcy8nPOPcWgKUB2rYyVa2xMfAuGTM4PLwtGTI4Uwvvepo3HE/bLlgS8XJgPZTGr3WOrzgZ1C1q4WxEvUk7WCIYPKv/gpyL2k8idjIkAXGEPJ7H6jzrukvYZqE5EDNLxQl9UcdwLUzcI6ujN85KT/J5QyJOiAxJsLVua+jgy2nGvkeB0mvC1a4TQfgXs66HMvEQwnE8O1hUmK3B3DZrpcAjXKbs3wJLcwOTMOWydBOKr3PdMUmjiQF6pPaUd9sIlFf7F93yDegstqp6V0gh3JX5HqbdV2uGqPCompqfGWuzv/g607ZQVrkTx7rrxm3wTcvBo+NvFDnyWuTFoUX4pJ8IZ93TVc</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>