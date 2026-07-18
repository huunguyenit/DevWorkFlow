<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">

  <!ENTITY UnitTag "dmkh">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Customer;
  %Control.Unit.Ignore;
  <!ENTITY k "ma_kh">
  <!ENTITY Tag "vkhhddt">
]>

<grid table="vkhhddt" code="ma_kh" order="ma_kh" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách khách hàng sử dụng hóa đơn điện tử" e="Customers Using E-invoice Declaration"></title>
  <subTitle v="Khai báo các khách hàng sử dụng hóa đơn điện tử: thêm, sửa, xóa..." e="Add, Edit, Delete Customer..."></subTitle>

  <fields>
    <field name="tag" width="60" type="Boolean" external="true" defaultValue="0" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_kh" readOnly="true" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" readOnly="true" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="status" readOnly="true" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Tình trạng" e="Status"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="status"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBD89jOGByexrUNBrJXupuZos2CdLeJIGgEA3WQJd+TwMa8HX3NjlWc0ZPXQxWRTl7pp7ObpffgNeMT46hST/oxvWH/1V/g4fX/Q0asmtY9HZLt9IovCLTFCdzdNTXumtK6uWu37C8ZLox7+MD+pnrNIQVsSco+JrYLP+ZiUqgLxk/a9uSV4rCkz2LYTOZIdJw6/QDTZwDze+bQMpmPP/u0=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL754lRuNuvFpF1HNw/sgoZdFOEQkwf4r1BdnbOKDxhow+Ig2fdDciDExXbATNpCFmm582kelMg9sUck6JmlZWonz8=</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL754wnwYVyEVpSbGjxbVsQd20P3qph82LDGWqYSQIJwSLxN9uwaX0o5c51YVx/pv27ASkNfQqtguHhejD8cxyw0TA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevg2BvCQJh7SpyljlNK7fzDh9ZY1e7VI/vC4TIUBLSlAJd6ZAecNCfw+WuSmG4ObcECeHYPq5UsNUYti3ExNxZogxOaWU22uXfCZxy80ZtCuk+QRmspqWZY08cbEVrjATjPMyLPfRFTKcA+zwTxN4Su/Ez0y6A49LrYS5GeMvi84QeemFsKQT7XCXn10ef5Y/cwkPZJ1320bZwVL5higAsA/3sPdR8LP9o41M1NfNnh+yHtJozeq/ZWLAwqBJzwOcqCY81IHbSx3ypYesx5IlHkmBXyR3A8w4nN7ARwqVzLfrCVsYqISlKRXukPTD8ili2dxw9+qj/Mg+Yio8TGknsxiGQOevjFv0Cunvls6RgRLO9F9he/hJRioh63OgXCTWwi54W3Z26L9EOiukTwABDy+lr4hr4sSEHZeJZYntnjo9cn1UJy5HWyT3y6Wk6LaVYvFi2Q8pIhoWrRAok1KfYdQarW+ZRMQE/f/VpkbwVpSmJyQQYRKZSO028JNhc0zWttLuoeGtrJSB7ezHGeqjxFO+lQqEgbtiKopfyo0jajqI54qQBv9x9wAT6HHJeEaXcGFmOVxkzRoJPeEzIxhejxvNP9yHzeo0Iboa1kqvubDhl5kyutW1xldIw3TgwhREJEV6frnPUSVkoA5CeAcwQ/MwjpSeu4MQR2kyVYhhI63TFb23zYn7hZvxb4CCSXI2fRBoKGkaiOOp2RBu361/cLExFRnpEKkZbmXoRg5Xp/u/ev9IZobKzT1Q8LlW3b6+bqC4S2rAYXzEcA3vuX5MoTHvPnFjGneYjMqE5EyHyb7yCwPu1FgbtJvhUUCZXEe9KbS2Pgxy8tnZgZ+oJixz+U4FDF3CrC0ujzOh1rzajuK7qOax0NTm+pUPhUf1evTYVUvslj4B4EQZS5n0uE3A8shqd4NbvOO2ekDQRCnEMUAYObQqvzB1eWsbdXjiQ4WQbGCfs8I3uG3tJNFls5KNhu2u6Pyt+gCRucIq5BVL6Up2W4ZbKs22sWzMRp6kNDfmrJ76dlSpqHhLKLKAO577geMPTO95B/hqr8a1Rcxltkl8T8vb5aYHqyN+1VufNc1InKZjJOvbZ4fLKbypm1FetZ08h0ITknRRYZI69Ck7CBb/DN+AjobkcQqspPDYfkWZGgabnKrR3ue1j6ehmXyZkyIqsBWOFO0zxTzn/4+yLK4B93aIQAaJlJalq6sNKPlwI9axjtehMMVTmq3vXhiAUAtL7Y+oCxqLlJRKa+Qje3+R1J7/BnyThnJOVE+jd2MRRIuyaGMNcHWjmfHJcVDYHn8M6eUruHzGn7dkU/de/gEhFr/Vaou2+TDyUkWhbEilW</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0RFW95n6TNWfxFV+1VAmgnAWAmjMRzypV7PshrbfXRyz3/zhfXZuPBYKnl7bNBF4neZtrvCWHfafzjsG3yM7gqgdFMK5qNkpGc1r6UiIMibiBgB33xHXy2WdYr7d6PbwpP6e8D3gfuf+d+SQ4l/2eQSi8ETLwONxq4ovIgjigxmbCoy9FvHCslFB6AsscUf5AwJEK2A/zXhsVZz31YgUFaBvpLKXRplJKL39jzTYXJ6A/aYB39H967HGU9fBFKkxw==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Registration">
      <title v="Đăng ký$" e="Registration$"></title>
    </button>
    <button command="Retrieve">
      <title v="Khai báo danh sách khách hàng$$90" e="Retrieve Data from Customer List$$120"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>