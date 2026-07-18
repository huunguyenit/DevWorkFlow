<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m94$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PO1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Đóng đơn hàng" e="PO Close"></title>
  <subTitle v="Cập nhật đơn hàng: đóng, bỏ đóng..." e="Close, Roll Back..."></subTitle>
  <partition table="c94$000000" prime="m94$" inquiry="i94$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <header v="Mã ncc" e="Supplier"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên nhà cung cấp" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Thanh toán" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" allowFilter="&GridVoucherAllowFilter;">
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
      <field name="t_tt_nt"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGsG8HAAYp9TCFPr+4cvAtgfV3lWCPDU4Xv5SdTcja3hun+xuBWmc1iN7SKHuzX77zaLnOJ0ldZOG0YvxW04tvgjlzIm2wiFfpeX8rJvw7fMow==</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egcuE7RDtc1IDnDN7wa7BlOA35Y77Bzpcq6lnMjsHGky2HHFG10C2dymj5xz4aapAv012t03ST2WgzRtJNbH2nMERHDFO51/kZxfnJSt6ht4RDyuWA0TU2i5D4paY9LUpM614In2SY62uVxz4aPtxKHcPQ14hdBOG7D03ul2zQGw5t/qgLqn52czt9TCTuV80z/eIUXo1uJ7VIxPRJ5YRru1/OXNHhwyI43Xj5yS7fD1AZJm+cgSeGMFh/ofdsK9Gb38KC2+vgfNgcUhu12sR3qrzi1nz17anGowagJMBsukaO6xWPYiOtiTS4SDlDtQcp7Poh3C5LbYlLCG3RR+fS54FUFB8EHmW35X2EhDHEW6Ydb0QuOWv/SiRWdrmPFSLP7oRYWz2+nrr7n/+jSAAryQaCBkXEeUr1SHTwq5pFBai92ykn7JFsh/Rrmzq/Z122QK1qCTEIIh+puLGYkrWSzVRx7sJitHbSNGyVMomL5sMNZR3imYm/YXQdWjr8sUBVQKt+yYwzPePvWTp8V0geXJlT1r4UJ1nE/dwtUeiIQlHDaJxedAq+KkukC3kSlvEuqIEoLHS/dCJde400AW6sr8fVF+OKxIAUQ2euRz98MjvnXWjX9TdLPh0cPE3UmWmD5M7mOo8t/ne1XYlt99UUdVJfDFP26kwMZnhkkjOptxjPnWTbpWJkyWzrhskvOl31BHnh+TuccvTm8ggogN5RqsC+20Y316NgodOR3gFv6fBihL4BclcJW5VawtWosDp9Fxr8IY4NuWW0ZedoH9S6bC7e5Rep1XmtglNfqVSx5MAOpr0CXHPCotYirij9RVtlBpSW0XKM0tXtkMKVd86Tl8jYRpyoghqMn9ldQbnROLsSBtYxiaLwZwWGkuoUzqhEqaiaUH2aaP0R4rFVOJ/IzofaglVm300EhM/QBpxL4gGrAzEXjXobzJ3oQLFdFWlABuXRmgMADVMUbQcFHkC7iEP2lAtwds+ynDGUolSVhPjHtvmUmJ/5iPRUsOkDXBwClBqovgM0ozrRUndHxI8+bU=</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eFxJHobfa6v1oQdQEns5QKpAQ/LB1rZ3l+T7zCNbBzDEDxgBE0czdsprjBBRpPH29YKejG7TDGXJSQhdAZKaI4QoTzeevkBObvFCwZHMwTFC5A6ENV5nEhgp1foHUITPYYvyNTlJ2zGW1e2AEiCJpZ0fs88+ouBRL/XfuBg/12CyHcuvLUEaVxsGxVmf3ejbq3+ZX6jTAiZ3qjVf/1e84lHyaoAfjKJNllxe4sic3L8vaKQ7vL6x29+IVwulZ2B7cPDMIQSJiJvwfRDevURe1gxThX6K/LRU0oY7hGkHplJ</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHshx7fA1Zosv853UDJ+KV3O2etih67k+mnPS+hn/+NhfuRc7pLaiXRXdrfFJrJJgP/bzX5euxAnJK+uOfRyjZYly6WVAqJZqxFN8z9ssU8GYa6VjSoSRG+WMo7mAyu0lxoQe1tZiMkRluwi93mGCujowrJQrTaYfVB7pWHMZOR0JNHyWdM8lcz5JloxQUgPQZJFDnYBy7XdynqSso+pVC9SLY8twseRrAi7fkZEQeFYZ/KrnD7Ca6Yr/zs06k4SyN7zazHSFV+pDgfYY4SFTx/eiB9koqDJxu8CN6/BCahK3vlm/dIv/PTBY+acMLhEhR83jQdDfFh/Xe359z3gUZVFhjVJX6/0EmtdDq/7Qcxpl+19eJ4G4QicsvZPZUYfA9PJRZqlqMsiBXAAUTNlKLFPZSGDn84FoU0EedPfNAJUTZhkHMbt5aIuiS2CbBsaGcl9vj9177tO3XWMxdsDQlFf3PF/OFYEnn9bITEFg1Npcxe92Emp7M61wkMnZgrhJ0hCzHvv4YwstKfHZelwqJs8cTg5fGCIY6+oZ9pskHnX+Dl6w5XfPZwTzEDPfo9acy/Nqw+XcYxWNcOZrP1dZbFRAVaspYFxVqnsrfjsXOMY7Vm5CyzNHCx88egJdd48bNs=</Encrypted>]]>

      </text>
    </query>
  </queries>

  <response>
    <action id="Close">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOimOKvyD2ExL+4l+72IKTESalazKEzZ+LJnp4LA+7FhqOaqxg2xiz0A6m366hXuZ8YVKUJ5oEk93KCuWM+Dl5PYM/XefEfWvO2RC3mQP8o247mA7xleJlmPdwhDjPU3Ghqvoz1Azug0zCoapR0yjBw5hcuyw55woqpMSvoIKlnALD94FhpO9nkAsGyLQs0IxPCpMPOyd3VI5UkGPD3qw55VSuGFej4mwG4ts6up8yO6K/Di5//TA3tK8osQs8YqiYYTNNqMoFPGl0B/yyhqRPJiPvGQ1ykEICdkRfS5OHcOqWtTCfwEBMw9uwUuyCLk3SP0qYE7UlTMKclDNlW0nX3a</Encrypted>]]>
      </text>
    </action>

    <action id="Undo">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOimOKvyD2ExL+4l+72IKTESalazKEzZ+LJnp4LA+7FhqOaqxg2xiz0A6m366hXuZ8YVKUJ5oEk93KCuWM+Dl5PYM/XefEfWvO2RC3mQP8o247mA7xleJlmPdwhDjPU3Ghqvoz1Azug0zCoapR0yjBw5hcuyw55woqpMSvoIKlnALD94FhpO9nkAsGyLQs0IxPCpMPOyd3VI5UkGPD3qw55VSuGFej4mwG4ts6up8yO6KyFNkZ1Z4pqXTHoF9fUNdkddRsZki9kugUcD+44gDg14Xf50yJP7UfNg6+TZ0pCAO4UNq3ry8NlxOyV9AXoKa276fvp2hmpZu1KKNVIGVKta</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6SycXjKTM6ycMLJVwbRiKBeDiB7+d5+EXZCGDYuvG8PGnzqXlo8mzQAMq+Cr0wgMPJh7uiXOWRK4KKkZ4j8P4PeBYZCwAheDAlbp5qpvIMCsoQbkw9pclkVT/marGHI8j4CJ+6XHYquIZKu6B5NXkJm/PflxrRByJl4KMOb90OaNEZaWlc4lyqpxGtKAQ1Xg8144TmO0DADDSk+FtKPkdEL2GhvDk13WCLXY3OvW0biXdrbW0d+fcUUKwbJmu7T2g==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Close">
      <title v="Đóng$" e="Close$"></title>
    </button>
    <button command="Cancel">
      <title v="Bỏ đóng$$75" e="Cancel$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>