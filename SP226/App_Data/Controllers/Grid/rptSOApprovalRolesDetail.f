<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo chi tiết quyền duyệt" e="Approval Roles Detail Report"></title>
  <subTitle v="Báo cáo chi tiết quyền duyệt, ngày %s..." e="Approval Roles Detail, Report Date: %s..."></subTitle>
  <fields>
    <field name="chuc_nang" width="100" allowSorting="true" allowFilter="true">
      <header v="Chức năng" e="Function"></header>
    </field>
    <field name="ten_chuc_nang" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên chức năng" e="Function Name"></header>
    </field>
    <field name="nguoi_duyet" width="100" allowSorting="true" allowFilter="true">
      <header v="Người duyệt" e="Approving Officer"></header>
    </field>
    <field name="ten_nguoi_duyet" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên người duyệt" e="Approving Officer Name"></header>
    </field>
    <field name="quyen" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyền" e="Role"></header>
    </field>
    <field name="ten_quyen" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên quyền" e="Role Name"></header>
    </field>
    <field name="kieu_duyet" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_sobcctqd', Controller: 'rptSOApprovalRolesDetail', Name: '[kieu_duyet]', Value: '[kieu_duyet] + String.fromCharCode(253) + [chuc_nang] + String.fromCharCode(253) + [nguoi_duyet] + String.fromCharCode(253) + this._group'}, Script: 'beforeDrillDown(this);'">
      <header v="Kiểu duyệt" e="Category"></header>
    </field>
    <field name="ten_kieu_duyet" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên kiểu duyệt" e="Category Name"></header>
    </field>
    <field name="tu_trang_thai" width="100" allowSorting="true" allowFilter="true">
      <header v="Từ trạng thái" e="From Status"></header>
    </field>
    <field name="ten_tu_trang_thai" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên trạng thái" e="Status Name"></header>
    </field>
    <field name="trang_thai_duyet" width="100" allowSorting="true" allowFilter="true">
      <header v="Trạng thái khi duyệt" e="Status when Approved"></header>
    </field>
    <field name="ten_trang_thai_duyet" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên trạng thái duyệt" e="Status Name when Approved"></header>
    </field>
    <field name="trang_thai_huy" width="100" allowSorting="true" allowFilter="true">
      <header v="Trạng thái khi hủy" e="Status when Cancelled"></header>
    </field>
    <field name="ten_trang_thai_huy" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên trạng thái hủy" e="Status Name when Cancelled"></header>
    </field>
    <field name="ngay_hl" width="100" allowSorting="true" allowFilter="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
    </field>
    <field name="ngay_hl2" width="100" allowSorting="true" allowFilter="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="chuc_nang"/>
      <field name="ten_chuc_nang"/>
      <field name="nguoi_duyet"/>
      <field name="ten_nguoi_duyet"/>
      <field name="quyen"/>
      <field name="ten_quyen"/>
      <field name="kieu_duyet"/>
      <field name="ten_kieu_duyet"/>
      <field name="tu_trang_thai"/>
      <field name="ten_tu_trang_thai"/>
      <field name="trang_thai_duyet"/>
      <field name="ten_trang_thai_duyet"/>
      <field name="trang_thai_huy"/>
      <field name="ten_trang_thai_huy"/>
      <field name="ngay_hl"/>
      <field name="ngay_hl2"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idiT9+TckNl1Si1k/XSaraQlxRKzxu+s5xLMLIrCNkEQgMJMVzJr+RFsIj6oBBfkMJb5rYOXF9yI68NzKBxIf2UuQRc9poChenssK77e9OKzLFSffG0G4A56sFhJBQtnD/q8fer5X31Ooa02Itix8YjnBTWBcFL58mSMC8XbnPYdGKz9zPSEKtur3bPmBOR6HD4gMrvYCuX5WHuiFPum1AH2DW1D1JttZ7rGPu66U97IzcZdpF6zo5xqsjDUXFWfsZsVexsdOBkYf1fUeniENAibnpDkFHSpOwJYQ0DBM9BH8sDi8SmIdYMF7QvbMH7VbZ4xe0x01gDg4xC8rPDCQWjgfTIzrSZPLVOSkjkqEe2r1nLIn/nBxusa6PdKG7L7G8o3DashYpHU7x7mEaQPwKP1oqHhDMkFifYalhxJ/zTcAKePZm9J+smGYuJQQCGiIOc=</Encrypted>]]>

    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>