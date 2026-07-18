<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="DXA" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Xử lý đơn hàng treo" e="Operation Assistant"></title>
  <subTitle v="Xử lý đơn hàng treo: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel Sales Order..."></subTitle>
  <partition table="c64$000000" prime="m64$" inquiry="i64$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" readOnly="true" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Tiền hàng" e="Amount"></header>
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
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="t_tien_nt2"/>
      <field name="ma_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/LoBZviloreISoXiuNrsxnQxz1nixKWWZTMuX0kWwFNf3r7XNPX9TByWwLXAuvs0A==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGsG8HAAYp9TCFPr+4cvAtgf9lFENc95FGxH4cNVebk/MjZpVlWqxI41aq9G3CGfu4nYXh5cdXXS9QRZRCjtoVxIk3sMrKQIHY4B3En7YYiOhf+qVmLunGa4SkdFq/gy/Zw=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egcX1kpT/6OsU9X9CKyYGs5W8FG/tU1cEnCatgKHLE0T7jrcHff15YuTPcRPUdF62G7P/QMGr4N/7Jd95kIaMaQHJ4bk0DT6Rkx8esVroE9cbdWzlKace1X+AARQ7e7RjZAeq/jmnyWourRvlhaon4Ofz213LZ9vXvmdBLgx+f+5cxh9QDZZVxW5XHVOj59jvmvds7kK7wYUqr9vQolq4YCPb6200LSPIaXQjLwtKigE9gHxUn87Bvl66Rf2Q4AZBb2Y4A/v9LMcTdZgiBGnELirARU4pClMbVYsQOaeeec53bX2BNMQSMlvtH/JX8eFGLnuwoWIoGjytEc6nQrqfLqlJez9EUFwbaJYQw02I5p5E05MJOq3cwKL7yIXg3SE+HcAhte3iy01WphMmF3F4cwzWK+islsxoTd+4rPBV25Qj1B6Yuq7/KSKOwyk59TtSoEUOmcdgEBexsjdth3/0t9KMYIpRjLYJG7U1Z/4Hn/W5uhC07U3wN3CTyJ81MtF22LfUFXo170QnRxQsQMlTaWPeZt3lDTEe+Ql5qa9mjboCcxeuJdUDJT85egw4UhXpTTsRVvi+wLsnWFr645O0HPxQZt6IDRZUSK15KSZNbLU53Xy9FvjdIRInVtTui65445rc+DKGv3awf4nT+R2xRAIEBStahwWD/HC7bAG+WYGG</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIrIEuOmSbmiomvj63vhBgT5aBtgdl2xl7+PBnmNVcCN+zRK0sHzn1BmigUWPGjYxpQJ3KOSDCVovfREanmHPUiVnTRV+/id03qW2NvmxSb3ahxuVmSgxcwV8/xGOG5Yig4=</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJabPsrTjvnx9z04VR7SBXt4Sm5qxKHGQDDOf672kQVDSKbm+Kzrhy/9bN9zIjouoM4g+DyUm6oOM/Trhlwn/7M6xQs16z3atGmobiIcm50BOJshRXiT0StEk4K/20Yg2Mb9YAzyGzlq47v3UIA4BKp+nvnWUDjGoXxI4V+qhpiEac19SMj6SNf3ntmX+HBWzLg4uWwOW4Ciz+4fEZx4Qq1edQvdxvu2GzVY/XK9XAtWG5SzmxDOcYYNQnEDbeAicVpEl0biHWneTpxHpzZHj6Wptyd/ub+eLn+iFsnp3yDfUnOkY+pL2oongfzHurMWPopbQj6rwdCFYXW5y/An3TP+l8D2Wp+ijmkdQZ4EgAFD9YrH6mAsTVZtvqFXVh6lnSc8c1NSx7LawSmIc9UKryvkbCg0zgdHmUo8y4iXRLwp2HMq+bTXuPQr5A2fOh3LYawyelfr+Bdpk65aPPI3poUOgNvyDTQt6+I76dh3GZTLFLI3XLH4YckJHSfENdCHigcSYVglvOPCN9ZbD3tbQTkP+L5a6J3P8i5YFYI9fqLr6MBsFMiC5rmvNzSk21vrSARW+D6gU9y1NSeiOEGtg+/ilUtyvVw1cUnDS2cemiW19UBZD/JueNy2oUJivDmDgxpy1bKv9F/t7Ndv54UM4uZnTMBVheeMrxhni6RwgR9SRY1K59A83nmG/k/BF+AVgPE2pLUoEml4hNoofStoAWvudJ0nPooK/ApTfbB/752zp0/fr6xKgcXK7ZTfT/uogVW2u3UFnvJ6UxdBe0WVAc9t8bMWnm5FsN2eBIjqocaVmUJe2U8x34MMMasgb9RDhG2agPrZ5Oo1SLs/dy+m1KwrZ</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="Approve">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hj4YK6xbPUPN+hp66TSaVAw1keSEGYw0fQTFQTMO8cQZ4dIx+w554k3JB6vxwtYQiS+RWxuav9f9NXFCa3NttWMCztl8N9bwT1R0HKcjJliBA==</Encrypted>]]>
      </text>
    </action>

    <action id="Cancel">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hj4YK6xbPUPN+hp66TSaVAwHZgSJgL24qoJ5I1Leu136Sev8nAkVEunbHUFPGWi/PCgPjHjZJTthyPFWuuvwJ1JBNITaMitt5/oDj9DDLb85g==</Encrypted>]]>
      </text>
    </action>

    <action id="Undo">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hh6yCNhPuCiLIb1hW7TW65+xmHvkikfY2DCKjchxLQQmMcaFMY7iBPcgnpQBsdWCi2aAsHbE90YbusXSBR+dGovfrCuMVH5//V4qsFqJ5cP2Q==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5Ud+naG+CCdS8v1iq2JcN4vMJkRDJXTctMAmws4lyvXd1NcnhZELus15gHlXXymyQloxomyM2O7yGexgwdHImZMC99QKTLkNAeA178/w4ezlDQIn6bbJvULXXNhCVsof8vVEU2HqIrMIh5V70RNLa9WxO4EDRnNQZ5nAF6JQz0O2pVboXe/nj8av/xTTmWYocPQqaEKVvM1UevJCTsk69RK5OyMoQK/EuXOB7B/RUAQvcdYTyWHVN+2cmBCj5wU3dtF88aOOQfAGAOqm6FxS2Y=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Approve">
      <title v="Duyệt$" e="Approve$$75"></title>
    </button>
    <button command="Cancel">
      <title v="Hủy$" e="Cancel$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Undo">
      <title v="Bỏ duyệt$$75" e="Undo$"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>