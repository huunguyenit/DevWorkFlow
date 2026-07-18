<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m94$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PO1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt đơn hàng" e="PO Approval"></title>
  <subTitle v="Duyệt đơn hàng: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="c94$000000" prime="m94$" inquiry="i94$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="80" hidden="true" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="" e=""></header>
      <query>&InsertCommandFilter;</query>
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
      <header v="Mã ncc" e="Supplier ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên nhà cung cấp" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" readOnly="true" allowFilter="&GridVoucherAllowFilter;" aliasName="a" aggregate="Sum">
      <header v="Thanh toán" e="Amount"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nt" e="Currency Code"></header>
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
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="t_tt_nt"/>
      <field name="ma_nt"/>
      <field name="ma_md"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbTvxUmLFzLqTDL4fzsoo7CfSIzgu6rxTiwNQVArAKJpzo/1s6iuHc9KZeQhGVQj26X</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7523m82uxH1e48Y9rr7r/TZVrPKSV1I+G41PqdgTzb8fVg1X8J7rfWqtjdd36X6Ywvks+gDwKx9EelFo1f7KRm08=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758YYKa4ha3knY78y5nzdtAgIcR/1JoRsnNKkUJoG3x79HjHSx23wdV/++sgEwQPXZOkTGQG8fvxecWSa6/5S95Y=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z68+GKVr5MWsVPHYH5/lWS5DBUtwMrHDoEYcT9uKKV0UA1VmRwMosxT0WrKK7CY4c5WbEMjT4pkEWE8MxgqlwJbFsEvvDQ3cDIkR6CN5ejiPg/K7gZHtj+t6h2370kJew==</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&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</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJaaFKh7SqivlasRRMf7f02ia//Q7/eiNDyOliVkPaTq4mcb0rmrnjg8KgOhhQHi2V12vwksWORAR0JqLqQeaUmJe00xKycbvGGilxupck+8F08qMO7Dc3lPsm/1k3IVcV+0y1bOmMXktCq3I68+bX2yFMyOAbO1ujc8lYgI08IW/CGg3T9MlgYcEjQ314ErqjaCAjGRjytnYFlrdSby9Px7GcO5gATDiU0w4KpldyfarJUPd3c1UDANQKIYhnbK2oQIRPKXmvG/mxBkYgUf3VN3cM227KaiNcYCLOmB4CbiqWZ9osxY2Ecnt7u7rMnNYhwWz3r4nM2a8o5UctCVbyQiVp+YqvOsEcsgMoesjOQIGHM9Zdqs5jXtVx1PE7R6TQiiGT5uwvqFkRn83rlYFEATuzxyEQF6NeRuenaR62JQz96jBt+Ds0VHWDFOyGCHs65GwOmN8p4FZM7Dxz9nfzUfZg3MC+rpnz0NzNFLOXOXCELDw2PlQ8NJ13pBXXgi90vHBLjzooItw+h1lQ5GPAqmkuk/eU8p11nZARWvNnv9ft2GOP37Plt7Rw01x4gICH4nIYmtGdNLqJUaZKUO7mLLhTBwJt9a4BI/E4whGRlFuhb3allr6XJkakzykVaEinjxwmcQWdBVELDY47j1xD/rz/cNKdWqFx+Y3be8F+1yehdibb1ffHTKYaO07o4vqQVNXNYiWVhiDEIzr678QtyJtg0KxhaO/CNj4RNetPPgjE+QK73wESpODt0NpU1EEqFKBJdloPI0afLXUNq7zuChUfeQzvD43rZ9TMmUuJ5c/RjR10DyzONz7q4htsgxdztGpdY0+PpJJNsYQ6Ymq3MNvsYFPSKYMIuwQe7DkN4I5fEy4V5+x+AgMiDISe25yk38=</Encrypted>]]>
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