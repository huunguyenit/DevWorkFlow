<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">

  <!ENTITY % ContractBalanceCustomer SYSTEM "..\Include\ContractBalanceCustomer.ent">
  %ContractBalanceCustomer;
]>

<dir table="cdhd" code="nam, ma_dvcs, tk, ma_hd&ContractBalanceCustomerCode;" order="nam, ma_dvcs, tk, ma_hd&ContractBalanceCustomerCode;" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số dư đầu kỳ hợp đồng" e="Contract Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false" align="left">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript>&ContractBalanceCustomerOnChangeAccount;</clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="hd_sd_pslk = 1 and status='1'" check="hd_sd_pslk = 1" information="ma_hd$dmhd.ten_hd%l" new ="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    &ContractBalanceCustomerDirField;

    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư nợ" e="Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99D5JksYEPBHk7jjBP3nNgPjHohu0LllL5AjGif18foZFzhVuFEvRHykz4/nzhcvo/0zLsaUTyca4YmCFKC1elmI=</Encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư có" e="Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99D5JksYEPBHk7jjBP3nNgPjHohu0LllL5AjGif18foZFYNXdZ1Ci7tv6iBPmLlJusDI1+OHJruy2mmlpZFAOqQc=</Encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư nợ ngoại tệ" e="FC Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99D5JksYEPBHk7jjBP3nNgPjHohu0LllL5AjGif18foZFVnvICR89q4e0dNYr3mpwHyxHgg0QD8GUuMPjObHafdg=</Encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư có ngoại tệ" e="FC Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99D5JksYEPBHk7jjBP3nNgPjHohu0LllL5AjGif18foZFWakyvCuXLNEt0HVk56O1E1bV15GJmh4Lvyy55BxTEOY=</Encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 200, 130"/>
      <item value="110010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110010: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      &ContractBalanceCustomerDirView;

      <item value="1100-1: [du_no00].Label, [du_no00], [nam]"/>
      <item value="1100--: [du_co00].Label, [du_co00]"/>
      <item value="1100--: [du_no_nt00].Label, [du_no_nt00]"/>
      <item value="1100--: [du_co_nt00].Label, [du_co_nt00]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEz3nr+6dX5pTQcUFP2hLyuUnYtTl/UETzs6jTT7VAecFXEcrfc6hc8MsYkIBDVEDRB5k8kIrpI8PtyBXzKqWR4=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmUJo3D7MPGunQGWeQpLUtwRyXeWSPn0DpdrUw1dGHxOHIY+7hlpXT4PwOh6zWo/JmrjhyF5t0azi1G8wtXwS+WkiQKNcHXmhGjORZeHxvFNRw4zz60Pu3RZ/oZVNPsmc61R8aDRdIUbPRmkkFCwb6S0XCq+8i24f9+uH6aGcSRhf0qoZLH6tS/VFgLZ0/KTvcOc9uul6sET3DWiEDvNwDjh/VRA3fAhaTU0GfMYXbmzQuYJsUx02EGKF3hLu/EmIwJCO0b/SnJInVujIfYHKdphM0EGZkOgW6seJo3dYbBTcfCN5yaQpQ8AMNqhUCNOLQ/TJ54OXt7/QsthesL3DsN</Encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iunf045HAlkx62LlV5AWXsxgO+jQSuXutHmPb/FvjbxhJuKugEGieteZjk+ax4+ar</Encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcG8sGGMtsBSvW0ZOSuSdAXqKvi1pqYKhRzFh5acy/lDAkRj8s+RAqdmxA7q7hIXZCjnRxp3zfgbf8YhYnspd8/TuGDA90OzZ7Gls4anqgBiA</Encrypted>]]>
      </text>
    </command>
    &ContractBalanceCustomerCommand;
    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ContractBalanceCustomerScript;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYXKrAt4fKFHGzdkLHONhiR64SXQhSIJyLH24DPrLKb1KGIh+KeSTkpggpJPiuVl9W2O8RQqdLiSwD+/4P95Y0bMTkx9YhY4Zrc2/E9f2SwR7GJoOevuWozr+PiQ5jxTZ7nS54qu9oZk3aN7Qht7g8F5uBuEXcgtuVwiXfAjl7rG1/PKmhZMoaWDL4Q0SeoPn6SHf2XD+UMvgLNSAuXeseO0s5zoqvQCQN0kZx31jKs/cOyHinXznmVjg3cUtIxcjL/tp6mYdL9/XzMX6GIyVA0=</Encrypted>]]>
    </text>
  </script>

  <response>
    &ContractBalanceCustomerResponse;
  </response>

</dir>