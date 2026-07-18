<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vdmpbky1" code="ma_bt, ky, nam" order="ma_dvcs, ma_bt, tk_no, tk_co" filter="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)))" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bút toán phân bổ định kỳ" e="Periodic Transaction"></title>
  <subTitle v="Kỳ %s1 năm %s2..." e="Period %s1 Year %s2..."></subTitle>

  <fields>
    <field name="stt_rec" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_dvcs" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_bt" isPrimaryKey="true" readOnly="true" width="100" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_glctpbky', Controller: 'PeriodicTransaction', Name: '[ma_bt]', Value: '[ma_bt] + this._queryFilterString + String.fromCharCode(253) + [ma_dvcs]'}, Script: 'beforeDrillDownWithCondition(this);'" allowFilter="true" allowSorting="true">
      <header v="Mã bút toán" e="Entry Code"></header>
    </field>
    <field name="ten_bt" width="300" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Tên bút toán" e="Entry Name"></header>
    </field>
    <field name="so_ct" width="100" dataFormatString="@upperCaseFormat" align="right" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Số chứng từ" e="Voucher Number"></header>
    </field>
    <field name="tk_no" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_co" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
    <field name="tien_pb_ky_nt" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" readOnly="true" allowFilter="&GridListAllowFilter.Number;" allowSorting="true">
      <header v="Giá trị p.bổ kỳ nt" e="FC Allocation Value"></header>
    </field>
    <field name="tien_pb_ky" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" readOnly="true" allowFilter="&GridListAllowFilter.Number;" allowSorting="true">
      <header v="Giá trị p.bổ kỳ" e="Allocation Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ky"/>
      <field name="nam"/>
      <field name="tag"/>
      <field name="ma_dvcs"/>
      <field name="ma_bt"/>
      <field name="ten_bt"/>
      <field name="so_ct"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
      <field name="tien_pb_ky_nt"/>
      <field name="tien_pb_ky"/>
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
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Create">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oeSnCT0/9EWYyYtW0RDiKaNN9GRiHAr1Ma8GIwDlzkot6xE+uQjmoLqkdslRn2ru65re4623iVNSlPmaRYFXPNkO9searJopbHBLSoq8EoNnBdXbnAy4I8ElJi5QL6b+AwFFKiokCLDn66YEIObA0ngcH5zQ+4nYa7FCAebW4EVkNkji91RnlF7fLTJscSp4/14EIieXVYNEyBp3+MO6GpIAfE8iPLjdX1wiZt21rirDo9e93ca2SXvpqTgqSRttS9jhfRWqObzMZeV68aIMIprr9QtZ3ZDb7UVncsDl3b</Encrypted>]]>
      </text>
    </action>

    <action id="DeleteAlloc">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oeSnCT0/9EWYyYtW0RDiIVdlMj9J5sK22UeJZdQCkcZR1IcEUOrCAE0+MLxVSC//7LdEgBHsWOV0x3l6VP3Yf85B21zmohPYZzMs4qu4kgGUJAOEcMdCQaBwUVwwpgzn+uH9fengwMl/B09wD470sqj/LTCXO3WvI6cPzmFi4WuQ1LPZldzbAve93d0oPbf8K8rwJJj9gtwmJKkZy8Gah8lJe3BnE3tVtRzVA0XFksOIvgpIjGHW/yHfAuSHhelyz8KFhpVwDtAyfd4sMpywI=</Encrypted>]]>
      </text>
    </action>

  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLLIF+0R030DpWClvBbmneyDjQUmbZRj2AxXs9ZNoetXHe0AKOXuriOmtkeKb3R13xhn3hcA4DIEkJdYloH4N7OC7kQ/FoNrHr2ZPw1Z3WHXQgLSXLZEkRzkGbIsSvCpr09BWCEx8dr8+wIkhw7IWc3shQQ1kEmXsV+6h4wK1rZX0dHb4WfYgbhaFP4k3QgWyyr4aWxuVLKG2aL+Rur3m1yzHvTNvEwWsPf60frgJ9cvpOQzAetKFgdLewkdJMlgifeS1Dik7xbs7m2PvGPRultF313S8nWFRrLhZYz2yUECY=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Cập nhật số chứng từ (Ctrl + E)$Cập nhật số...$120" e="Toolbar.Edit"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="CreateNumber">
      <title v="Cập nhật số chứng từ cho nhiều bút toán$Cập nhật số chứng từ cho nhiều...$200" e="Voucher Number Mass Update...$$120"></title>
    </button>
    <button command="Create">
      <title v="Tạo bút toán phân bổ$Tạo bút toán...$120" e="Create Periodic Transaction$$120"></title>
    </button>
    <button command="DeleteAlloc">
      <title v="Xóa bút toán phân bổ$Xóa bút toán...$120" e="Delete Periodic Transaction$$120"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>