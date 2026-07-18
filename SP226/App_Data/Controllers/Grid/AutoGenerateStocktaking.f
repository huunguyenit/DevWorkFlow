<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tạo phiếu chênh lệch kiểm kê tự động" e="Auto Generation of Stock Variance"></title>
  <subTitle v="Số yêu cầu: %s..." e="Voucher No.: %s..."></subTitle>
  <fields>
    <field name="ma_vt" width="100" readOnly="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" readOnly="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ma_kho" width="100" readOnly="true" allowFilter="true">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri_x" width="100" readOnly="true" allowFilter="true">
      <header v="Vị trí" e="Location"></header>
    </field>
    <field name="ma_lo_x" width="100" readOnly="true" allowFilter="true">
      <header v="Lô" e="Lot"></header>
    </field>
    <field name="dvt" width="50" readOnly="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="sl_ss" type="Decimal" width="100" dataFormatString="@quantityViewFormat" readOnly="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl sổ sách" e="Book Q'ty"></header>
    </field>
    <field name="sl_kk" type="Decimal" width="100" dataFormatString="@quantityViewFormat" readOnly="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl kiểm kê" e="Stocktaking Q'ty"></header>
    </field>
    <field name="sl_cl" type="Decimal" width="100" dataFormatString="@quantityViewFormat" readOnly="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl chênh lệch" e="Variance Q'ty"></header>
    </field>

    <field name="lo_yn" type="Boolean" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_vi_tri" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_lo" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_kho" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="gia" type="Decimal" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tien" type="Decimal" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="pn_gia_tb" type="Boolean" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="CheckBox"></items>
    </field>
    <field name="px_gia_dd" type="Boolean" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="CheckBox"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="ma_kho"/>
      <field name="ma_vi_tri_x"/>
      <field name="ma_lo_x"/>
      <field name="dvt"/>
      <field name="sl_ss"/>
      <field name="sl_kk"/>
      <field name="sl_cl"/>
      <field name="lo_yn"/>
      <field name="vi_tri_yn"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="gia_ton"/>
      <field name="ten_vi_tri"/>
      <field name="ten_lo"/>
      <field name="ten_kho"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="pn_gia_tb"/>
      <field name="px_gia_dd"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBHwD6V3UunWN6aIVgRxH54hTA6n3Z3pBRZsOwLso2EGBzxuS5ucq33lOA106eeeSeaQqbAkesADlXQccrzLdby1YRM2Qkbvv5siIM08sq56itvmH0KqVw94jGzGiVeqnA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKXoDhppNgodsWkWZTnT9GGgLtMN5sxRd6QgmmFLt++iyvkbymLy0mYXdYbZMQYjBVyiVP7gbH0cJoEGBaRUfKPI56mT3TMkogGURTttNPeweA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWIWBFwRqwe2kGfgA7NVDCv2ypIac7y0nA+No9PbQO/u5Zjp31V33FdWhatbqahqFUae9emU6CwDGjkfsVMtNgDzSyXUf78qgq11rYKNsxZQtGrTGxy2+CoWNSRhMSv9gVhXzVR/YMkJo/TQ9/Mv5B3n62U7VdN9aq3gaHI1MFFS17ujitmH4x0X1aic+GOFDksi6cMPhgja6iDLBZ0ZmwYmlYabZfzcSHYZ0YkX7nG0qMAns4QEvekO2JZqz8U15skF/9tKRjERIx9jx0PWAnxcZNnYPfpbYpDKJAwP8fGL9kzTvlfbV7DkbP3pwfOWDJlIae/P2/gnvum7DDUs8zwgz/uVvYY66XA2AC2MJvOMpfowbvxygjhaOWMNcQrcW4oM9tiQcpDE20n/IaJEQRnKb41J65D5esb3/whqb6uH88TL9G5supXsu8As/l0bZ6QIsj0CybPUhxhU7GTRThaYZZofCgaCYXGh+ZzHiyfNyXAbi4BwVjprz+ukHcIV/QEBImlu2LBZDEbuIUCWJ71pVFDgmgkPpbJSTgqBagB3k4Ml60OgIcB0ovw5f0uMCrcKGW+Brs6YNBdopGKdKoHEw8CssKIhndlvxzxzaLS0DazflmD9Pt5zzccq6W4jCp60VdkESkcDekcg30DipOrII2s2+xBzkH50P3cryV55J4G/RI7jm6Gjs4DMRJ78MDw5tOeCZQAnXT4FQlf2o80avOvOK9Z7dl6sEhgDwurESpOYhFigfqqXuEThtzcsUcc3yjHtasUwraSHRDN+U4kuXT700LXTKPsMM25VXRxbvNPU3j7+za6gnrPmXiE8e1frsb74nia3m1lJVSexhp/FLe/mcPeHESQLS0FjR9PQrrLfSbEDsHcG1K0h74/EnPMTmjkMCiZTAVi/u0eQgheBAiF1dMkzJugFNnePWvYwiBpkaEl72ymFK7ACx72o2x88MfQkQOozQFp13VW9Vq/i/ICj2TCDWiSUb+wpRJDFqacc/I2mO34gdZNVy34+54EDqvo4uRDKbiQSj15ExSkruW7PlslOjmrCMXFnXvQz8wypkq8vZLIFhvrhtwg4IiyvlRjKFmWLNwXI4l3GkTcgQ/Q4sZ2j58W4A2dA0DAb3lgVKgkkpsR39W6z5XK+t/M8dSIrhMFCRnVwXXjax93mwl9EWVjXrjSqxRf4rzgoqHzsbd8E9gycopfz8uXsT3M+BhQwe9fKvXdMLwQYfGtebq4as28TFRU7RLq++9bx</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <response>
    <action id="Delete">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKeQTrejyfMsWhyx/15RRPNM+dVgNSAuEazJRKp2/b4ozW5VNft/OoO5PRHT8L4c5knlsrb0YF6tycHXKeyp9a5pRZewv1kC52grdeSblS08wHkk4b8X3S4poGtbLUiejvEza3320xTJC1cqjpGgyrSZXigkF9IYoxJ5cqcMYoIQt0ru++bD41eD7rvxvz5MB6t4DGNUsd7sR0UxGbY7C/A3nd8jXlrQpFgWtTON38yGwTQgXYluUPxmL2tanxlzSw0MUSZjiirVRaXTHdwv1vNWJySx0MRrXDkSiLi0BD2A</Encrypted>]]>
      </text>
    </action>

    <action id="DeleteStocktaking">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu45ozvts782k3EXgG0Wjr+IFfbSBZC1iJpLKLGswGjKjh99quwo49pO9gOKtMKrZLXQzQtDCrV4O3ND3yQO6D13vPB6/Hojtf+98oDbb/eNj1hfiq3GY0KIWxseAFgR8MnDVDjH8SNkntGQmBuZWVh8YLtWBkes7ZOnDkDyeowQmsE9n+0zCqlOdsPTCbXs4CTnoS364rN3fmi0akScku5SlxvVMMCVS5pEKBYDEJJ7fTOvx+MBpCa2Z77vxtgURHFsj71jZwn6qjscQQdYEH7UkWu7+Xh2li4j1sogWT8yh2qkvF1MXaW30irrjDqF33EOiUogSnni5mu/H+xFqTYXP3p0E5Ll8TPimbHxiGitLK4UA5neZFjRZuE4FI/SaZAHTplvA5A7Co92qDLN5BIA=</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2NQU/FxIIOiaLedEmniOx8NPGtzvMs8LDCGIz41RhBI7mON68py0YeoQGWvHII+9rF7nOK4cC5k5H57sh+31zYmfZVVftL1gLfHmFr4djrTemDQJrOILembnNiGzYk7mthShfIvuCMAvWE6q8qQYH1k6hrr54W+C31/ovXqoMr+j+E00qq/hiHBnkbBSxtUlnxHxbqL21Eu7TueWMKNVK7grJBq1lnLJveMhpHcVkh2ZldcfqMHrH/k9JoIRZmLAA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="CreateStocktaking">
      <title v="Tạo chênh lệch kiểm kê tự động$$90" e="Auto generation of Stock Variance$Generation...$120"></title>
    </button>
    <button command="DeleteStocktaking">
      <title v="Xóa chênh lệch kiểm kê tự động$$90" e="Delete Auto generation of Stock Variance$Delete...$120"></title>
    </button>
    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>