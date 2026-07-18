<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m56$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="BN1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh chi" e="Payment Adjustments"></title>
  <subTitle v="Điều chỉnh: %h..." e="Adjustments: %h..."></subTitle>
  <partition table="c56$000000" prime="m56$" inquiry="i56$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="80" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="&Tag;" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_dvcs" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên khách" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nt" e="Currency Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="&Tag;"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="t_tt_nt"/>
      <field name="ma_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XAXdS/8IVSB+p4p0JcEh9OHQ9gPIm6zwrvtvfKuwRVkyVPipY9aMBidMw0ZS4yRZjbwO5LgbTVCNFFYeGznwhI=</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753W7sVkJn1qX8G5AYCGuxo27k7doDhOZ6XpLfnT0eqn9wQ+/VVs1oUSBRCadbvlPbYSzBcawku2T2vsU1Q3RHV8=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGsG8HAAYp9TCFPr+4cvAtgfV3lWCPDU4Xv5SdTcja3hun+xuBWmc1iN7SKHuzX77zaLnOJ0ldZOG0YvxW04tvgjlzIm2wiFfpeX8rJvw7fMow==</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egWwuD8A3czcYi8MnDLfe2+MFX4G8Ly7H4BUef0C3sBiYfEiRuqtm4ssI9RkK4Drguw1lq2qdad8cpSIdeMF99IL9CVT1JerFh3X8bBDsR9UaTnO5PIbEBOcXvaG5PzCcJXhNv2YpiTN+ZnGifzxYq4ljU/DU+nO6j9bdMaNB0N7l/K5F6LBeN4FWPcFZqrSHR0zXrifGDBWWwWczOaaH7cp8zEts8geuV2Wna+jgWOVEC9BIHGOY5ASXLVrly6qm+fOWrS/UHKBD5bV/R5rwAWIsWIvOHtz+TCFr8lN0+FJMKPd/yt0BKfvvReLSeHQzUvKkCnJyonfTxxEhO1dp8iCdtT2pPa5jxDei7011/ASeUguDzjLfLoHsXSdczaCnKgnnV6hbyXwvkTt4H4NhqkZm5TVNUvKRsKstm3d5m2CxHAZfbhh3Xs6fjQ+1znNP0EXhgiv1kvn40uUjANgnrPWqcp2GdrVcd2PHb6i19kMUfP14cI7vGjAy3xZr7M7eUWb4iTi0gG+7yExRfBlOnYxr/2QCf693TCls46RRFkZpR/2TiGQOoMpGktaqC/+CiMoiQ1KDC+EEVQ92P9znzKtt56uLh5kzyOQTmRTzeT2O3MO/FqUM7+5cck9U29mv6zvMVCDs8Cj5jpNlJlZ0dMEyUoHmUG5etc0JfWKKTPclp+3aJp7fa4zYjAwhcoievXkV4gFPQV15XkNkdYl4KTJ6hrUpkf6tVCrn8dwG8cW9jT9aIVySGa63xG8F31H1pQfYtE3x8unpdfd3hVSav0WRFsX3qSJiON/r/SH6XwZX</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzPYn8njoKVu2y9d8qQcbvebl0AoqfOrct9yt+x0zDdM3+0XaIPwNXtFQISMLaGi5cVNZ0l7zpILQO1P4PFsUUPpfgtUlBFHV6JAf0pVcLw4p9EOmRI6llqJhJps4zYuyr9cNJ1FUZgwNkeSlFFIoHGOU0WNx/0zwOO+UhcgF4Lz/b1rinsBLIp1Uw8plMozj3qoGCTswS+cyq/4pKbBPyxOCo9K0ukvdZ7L4YVsup2ZMWWaU7luGN+NrJq7u7kgOfOOjsejHaCaxoTKygRSZmMCzHuWYxXkAnKPWIPd/uypnr/ffd39j3YJXLjBDDotiVRuT0kT5uK0oH/p192EiZzqNMXWddYehSslJGxzjV/9mdMbS1dxV4RXK86pIkO+D+OSrpSbTx63+TUopbDRIMpJUk9BJkNgYFT1wtu0dnzfVStBwpY8YzNL7R/0vK8Dr8SGiFMfeLJbbv0KDuuV3R7i5rABqBMdex8dZIRog4f9OHyrOtEcoshsNxroGO5B+t77CaQlTnjH7YsR5MwAOxT7EAglJIVhlYTjZlTX7ZQE0VPzjxrjNDV+XBbZbppDFPEJFzGnXv+akA7jptyJ39XBI1+95PrIbuTLGtGPIv4sDkjp0tMQRZRoxQMTPJoBxbTCDoBjftcxQC4WLPyLxaaemRBdNCslmPKGXEwMHZddytMQadKoojsqmIeIaPVMJuCPsNWE/lVp59zt5ITRV/9tRQKxH5O+5TsmmCM3z7NtfQ9wLU759I41RthhKnPtvQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy+zBqJKgxhFfYJU+8sltyNZPhWPB8v/nnGeNB4j8dUgA/v6QUvE16dPi86Sq7L1OkFp57vYOtCPe147d6EhPYL0CqTUAZVcs/4VirWqJWJDo4AVgRtcypYAr5Ebb8A/gsG413e58h3wwrRLdfMDVltaT4Dj1bBl9grInW+yKlSRJA8v3MTEz/DQJobg8SJEst/dtDxp4qkavKPqRqvtt3I=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Adjustments">
      <title v="Điều chỉnh$$120" e="Adjustment$$120"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>