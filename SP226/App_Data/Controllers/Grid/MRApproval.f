<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m87$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PX0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt phiếu yêu cầu lĩnh vật tư" e="Material Requisition Approval"></title>
  <subTitle v="Duyệt phiếu yêu cầu lĩnh vật tư: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="c87$000000" prime="m87$" inquiry="i87$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="dept_id" width="100" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên bộ phận" e="Department Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" clientDefault="0" readOnly="true" allowFilter="&GridVoucherAllowFilter;" aliasName="a" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Diễn giải" e="Memo"></header>
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
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="dept_id"/>
      <field name="ten_bp%l"/>
      <field name="t_so_luong"/>
      <field name="dien_giai"/>
      <field name="ma_md"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbT1+ExM3bulhWZwVDqYLj0IY3CQ7bDx7YXhJFU79QR0NF6udrRKe34O5siAUYWo9cu</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75xrrKY40YsRKDmY6WEtwmKcOljg7u5IaEu2Fd9Fgi6pNXxb2oKFUUQ05Xcr4aMNdeHhZ2PCt9Qg5yjFu5mSau9g=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL752iEaLB/KJ7Igsv8oWt/l9lSbqHtJruf7ZshELeQ/VcQXJu1yC+W4cHYpkaK3bU2slsOQK9BabtjsAZuPNVHlfk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XjWVpkbwf5VWwME9PkFZ6j4vvyuh6/7oSz4gQh+Cpu7QwZ/VOgQY8lnSTccoYHCTzJWljjIiudv9is17PPs/dXHeQlEGWlSK/NsUtgs6DIbfhtpijOi6X6jhU6ADDzmN0vCHyU205tEVLgbsF9JwWg=</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&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</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSPEYXzPZ1oaRReIa4A7z5IViV5NMA7g9X11UZGYWQTlX7P+N9IaXPtswvPo3qhDI4Y2Et3IuxVA8yGOWPbXEhgvTStcahPREdZXKElpVBzvoMzJA451WBSXn/uM3juhQHd1o/0cEpjrOuqFdizYAaikATTutWqPM7I895w9ldruVMleF7OQj3Qlpcw7NQyfppj0H9CIyia25t8zLQvEnIf5HvfXSRAXlYSOioFuxUC/HaiQmJ+6UK4VIVa8soOF74=</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJabPsrTjvnx9z04VR7SBXt4S3vgBY/uV5Js1Cq5Y94a2H8OYgS86XNP7dP9ioF706IdVmgMdn8mP7MjBcBXbdtGzZ38kszbEShQGrGMTStfgqRXcyv2a4b7I+NTrCrOEaprYFRHMqb3EuSGLruT5wUBYl+qAMrK8Fo9TCIWbhk274T3+OIMg2txMgC5q1VadvENbsMJHg7IWxK2k+R8RLG3tOKdnGyoc5K/aLNAsjG+VcALV6fRolZIqjwvVFqjmSqdXw5kErBGAGyV10H2dqavfVJCl2y0afHFF11enRB0sjtkXJVEZVjLmAetX8DZpr/WTh87N6jANEjVeniDmH3MkptECj4Km2O/hRJ40tyOcD/WTgQl0PzlA7rHDeN5f6yssc4Dx+KB0G5VP5tSQ/oDcPPgJ3PkZ8SfOfonVFyAmUPlhvodDj+8j4QEdymg2lfH2Psh67dyU9O1cKJFbXXV8gjwyIzOTaKbmgwOzOXv5FOhos6N6zTXWFd8P0uQqclh+lLV7V+wlre3WEk3bBuhBlShYlznUphoUEYmkhmzD4hoKulgccvfLoIpJJa8nuJnBBI68BYC1wjknegOgxq4uskH18smPdmGvyEwdm1ePdjYlHS0P/egFIPgx+ZuEIjDvGpnrEwy5/kNrfnnT+fj7sF+ZmOAGD/6G6pHYQ5pyIA==</Encrypted>]]>
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