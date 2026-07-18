<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % ManagementObjectTransaction "INCLUDE">
  <!ENTITY ManagementObjectTranDetailFieldReadOnly "true">
  <!ENTITY % ManagementObject SYSTEM "..\Include\ManagementObject.ent">
  %ManagementObject;
]>


<grid table="dmpb1" code="stt_rec" order="line_nbr" name="Memvar" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <partition table="dmpb1" prime="dmpb1" inquiry="" field="" expression="''" increase="{0}" default=""/>
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" allowNulls="false" width="100" aliasName="a" readOnly="true">
      <header v="Tài khoản nhận" e="Receiving Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="b">
      <header v="Tên tài khoản" e="Description"></header>
    </field>

    <field name="s6" type="Decimal" dataFormatString="### ### ### ### ##0.00" width="100" aliasName="a" align="right">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_he_so" width="150" dataFormatString="@upperCaseFormat" aliasName="replace(replace(substring(a.tk_he_so, 0, charindex(';', a.tk_he_so)), ' ', ''), ',', ', ')" readOnly="true">
      <header v="Ds tài khoản nợ" e="Debit Account"></header>
      <items style="Mask"></items>
    </field>
    <field name="tk_du" width="150" dataFormatString="@upperCaseFormat" aliasName="replace(replace(substring(a.tk_du, 0, charindex(';', a.tk_du)), ' ', ''), ',', ', ')" readOnly="true">
      <header v="Ds tài khoản có" e="Credit Account"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_vv" isPrimaryKey="true" width="80" aliasName="a" readOnly="true">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="c">
      <header v="Tên vụ việc" e="Job Name"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="80" aliasName="a" readOnly="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="status = '1' and truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ma_hd" isPrimaryKey="true" width="80" aliasName="a" readOnly="true">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1" information="ma_hd$dmhd.ten_hd%l" new="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="d">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>

    &ManagementObjectTranDetailFields;

    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="s6"/>
      <field name="tk_he_so"/>
      <field name="tk_du"/>

      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
      <field name="ma_bp"/>
      <field name="ma_hd"/>
      <field name="ten_hd%l"/>

      &ManagementObjectTranDetailViews;

      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7536Fqi5N0A6Oy//QWbEaYyEzh25y0oN50TdIsFpSQYCDnXRtzSITHOL7RhgVHVetF2gIVpMGN8rWpmtlKEqFJWw=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ7cxrm0qZBABkCWZhSwJUgc2jqVgCZyZZ4waTJJYHVmuN1d9IaKqrJKZY+MpV2+38NduErCwnh/kXz+HDCbh95O</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx4BVleUu6ID5v8fHUY3e8UwcOvYa8WvkyKaT//t4oWiqMlGOqhevXLHadY6+PT0fdzoEL92axjvRjzl0ylSOh7NT8k0AvmNOZakroea4Gp/n8/nQvRUt55sTxxzyyEIbmDP2rfgzt94Mdbxya2+HlPSg/Z3IMZMAxIWajYzqfNjcqTKchS5DmTCvkdP20v43vqFH3oYnPFnk7+FSbsdiFofy8TDqICW07icylw+jYTpAszpKZbbccuOZ6C/Sda/d8EpHKCohBAtI5K/hS+jG9EUjcLsFKfIiv03azuWl2zK8f5DWOIH3s5b+fXQUvwYdebv6ceqYAQZF0b3SM3/hXruJ59zsqARIqWM8u0CCeFkvbeCSmGJfwscs1rGRLC7xIALHJAxuWZybh+e6nu+DXiCJs1ExHS6uQ1J+oSH4uRicqDAHWKeLe2UuessPS9wdjXVJsS+i3vtKSTgFiSXe9A1VS0ex07mYUJuiaOcTbh4VK+rv3wkqaoGnVOV5k4hy13MqGVaHQa88NcDIQVlGIzLzQbb0aFQaAUvO/ncmYFDh2W4tlp7J9ztJm8HeQcf6maISrrEVKJGtGYtz8vL0i5O4grXY4crRHJAKWh0ywo1Bu8UuZTGUWFxVkvv8mfWsyc=</Encrypted>]]>&ManagementObjectTranDetailQuery;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNLeWL1tFO9gIOfVQTfzRLMnkcv2G0wFKB+xN8RXev6MH23vn1oeR3/WrwMqjrK41InNDFIm1EcK53zRjkDZ52tFzl3VVsAupa2TQ9L6Edxlb6evbNArIyqv3BqMcb0iXcEokMPBefXtj518ACsrIrii9wFqQ5eEr8afSqpCA6pyamF5Iip6nxfz+ny+mS3YR/LEbswSYKaBrzIiLXRSrqp8=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>