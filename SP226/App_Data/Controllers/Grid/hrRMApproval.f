<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrrmyc" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="H10" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt phiếu yêu cầu tuyển dụng" e="Recruitment Request Approval"></title>
  <subTitle v="Duyệt phiếu yêu cầu tuyển dụng: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="hrirmyc" prime="hrrmyc" inquiry="hrirmyc" field="ngay_ct" expression="''" increase="{0}" default=""/>

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
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbT5SnLKvx+i2OyOzd+SuwPKewN6minywrIhKt6btGya45PtxrvUegloUddmoYylPCu</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756dwKsXM297PfIVYZq7hF4P1uQtx5W/606D6JIjfgrjAldZF+uJFtxhMG+gb0P1mzZ82ukMsBAy2a9e8qdNFUgM=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758dGs6qSP0TziJM+5fmvOks/d3BOlCgdbHy9h+/MM3bwUAxCc6jE7xiSElFEBmA2X4S8K9p4AtEMbqWfcBm3BKU=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22d/fJADsOjTbOKUcDtxDhp+4vc1i2yJ+5JnrzvjdFXG9fS42rhh90m3Hq0Yj9IE4at55I0vPJFzJ0pZ3pVYk08r6+evixYfWFe7gn30sisqomBJpddCod/RRRZKe3I4dlf9KFcGQqlx0Ei5hGsl5J1W+Oy26XZpJ9GqPBZt/LLn3</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&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</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJabPsrTjvnx9z04VR7SBXt4S3vgBY/uV5Js1Cq5Y94a2H8OYgS86XNP7dP9ioF706IdNVvjIHxBxfiuFjKpIQPIN2j8bwmi1wWM6O+VGqQEy6BBHOk7kZnY5MiY+opwBGYkLTXy5XC7DXjZ6mE8Ufw9yEnavKi/eEx1LW+c5v6I6sniPRQawcYsqgbsCU4Y0bO4bka7JjstClORQd5zkXJsB9QHcAVzlDTf8ELULY4IJOYf5kYLgRgXKpg2SSaBmmbXOFcGgLPy2Lp2OwwcskFRDGJZMezr4gXLG+WcmpHdgwO/2SAHZMP9TvjtKnQBEChZDClILjtKJq2eSkHYlpjH0fPxDAKEc6YClECWSXJYyuNn9NP1cLLFZ3RqGcBShVCS7v2KUvaRvsXDdwfB5L+JYj7FBuAEe9gfwKwHyNyLcBYHDs/8ZT8IyakNoaIr9l35YbBHuFW3l4uLsjy1sOE2FPftymue5i7hOBm/icTfJjrOt6b/pBmWl1Ue0+A6AZmnRWOLYhvKlM5P2+aHj/odh7dSrJR7tIHiKDRqcf4XmtcDkEwzykFO/KY79KoaYIBhsgpyBUiU01KQANn3gTowebAG0Cz/ODH7SzThIWjI1ZY01pfYW46plAwmSfNKda4ttOORIgGzVQ+V97EYau61KISrKqESYty9tgdJ+uiZa1g==</Encrypted>]]>
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