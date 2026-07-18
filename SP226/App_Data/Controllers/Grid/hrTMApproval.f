<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrdtyc" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="H07" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt phiếu yêu cầu đào tạo" e="Training Request Approval"></title>
  <subTitle v="Duyệt phiếu yêu cầu đào tạo: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="hrdtyc" prime="hrdtyc" inquiry="hridtyc" field="ngay_ct" expression="''" increase="{0}" default=""/>

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
    <field name="ma_dvcs" width="100" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày yêu cầu" e="Request Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số yêu cầu" e="Request No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="0" hidden="true" aliasName="a" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Nội dung" e="Content"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_md" width="0" external="true" hidden="true" readOnly="true" defaultValue="'1'">
      <header v="" e=""></header>
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
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="dien_giai"/>
      <field name="ma_md"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbTec6Q07VciOpe6nEYfnuI+sOXq3lUJufosMUoqZKLjNvqhiZ68TXDMx4cflxdZT9D</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+kBjDj+Lw0FDCAJAQMIZW7INvYWfKXGUwNDoTXV6UFudba+W3SotRe64mCLF5tsb4NM2iczIPJRoBjwU6w4xd0=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zcXO2IPvhf53orsOH6+myIlMODqCfG5aXr1uB/fcLaO+Xk/4xnFcMUSzRUWYHQCZWNSeVgnAnLDcmWkF397kC8=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VZny5J27oY0YuO3+BMWMAl/GzKrX8o1UyVKREXwu7JveVKbzdNFFZ9sy1zq9kJ9hutAg5dA6hTqg+FPtNBuKcaaAOvNugQjMaqb5iSjRbIjOah3Lv89TK2pi1yLt8PKKmQHmOQHYN+R/QhHOapW+Mfy9A/arJHC9BcwMsQUVScF</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&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</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSPEYXzPZ1oaRReIa4A7z5IViV5NMA7g9X11UZGYWQTlX7P+N9IaXPtswvPo3qhDI4Y2Et3IuxVA8yGOWPbXEhgvTStcahPREdZXKElpVBzvi1i6X4USm2nFRanUk9/feFFt9XvX+RiYSJMl3c5Efeeyh5e1lTK0wsGSxdSEtioIgplC5TCT1wdJFF1AIa9BydqcoxOgxBn1nXwDLul6c6Kz1HrMAga5yr+8nV1MbdY6RFVsN+gpUGQYdEQ6VTBMzQ=</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJaaFKh7SqivlasRRMf7f02iaBckDu3/IFLf+6SnV5B9wP0HkEO3UqFY1huL70ByQmlz4vpOchZH8rdbtQZmJcI99Gq5Az4pEsW46Qn3ZoOrBWnIXE8CJapMYiQ3Zzw/24WXE5B+Dtt5DQEL+QNR+fWlXOTt7OUl7rvatDR4SrrCifLn8kYP719y0QdT3GnqUIDRTorxzCfwlqEYN4Kgohh2pcWqbtEv3rVaQgMWtjAjm/Ja7yYPol36uLrPsdPh5AF+OxF9h6DjRprcHe/FWF46wio0ukSbH7VAeWyLgTWbi71Hux6wiwXfxTI+QagRKAdnbjaqOi/exOGjN3K/xIb12D00UnvP+0xM9A3dEPo6Ux5chGYcEkdtAj8O//1f6NvwV5ZlM2rpEBBuB8B/QDqDdeMM1apz3n6J4TW19KwZKcMeeD9CrzD+wTH7EIsf4nwEknmpO6/1v5a9dzQ52JSD044MM7ENz1PqMg/4N/K+Votc6KZABW31jnF4yHP3hPj4kC+eIoLVYplpG0JAF/Z9o3sJYykCsQNngKZz39d1EbK4IxoLH6hVKlhR1aUNvLNrqKkY8gkyX7ZPHEHbBBCoPYXSHSoa2MPcM31l2rs3OzwzpZPdcHWWEv/YnoIHKIfFXdzDiSTSRy87W07h66IRA</Encrypted>]]>
      </text>
    </query>
  </queries>

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