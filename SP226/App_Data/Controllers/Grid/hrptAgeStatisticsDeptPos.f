<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê độ tuổi theo bộ phận, vị trí công việc" e="Age statistics by Department, Position"></title>
  <subTitle v="Ngày báo cáo: %d..." e="Report Date: %d..."></subTitle>
  <fields>
    <field name="bo_phan" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí" e="Position"></header>
    </field>
    <field name="cot1" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 1" e="Column 1"></header>
    </field>
    <field name="cot2" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 2" e="Column 2"></header>
    </field>
    <field name="cot3" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 3" e="Column 3"></header>
    </field>
    <field name="cot4" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 4" e="Column 4"></header>
    </field>
    <field name="cot5" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 4" e="Column 4"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="bo_phan"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="cot1"/>
      <field name="cot2"/>
      <field name="cot3"/>
      <field name="cot4"/>
      <field name="cot5"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idiTLb+0IejaGMkD1XijUwTFzl4FKnvHLMd3s/yHkcjIsCbVK/v5vl3gndFrSGu6s0vDYdEwHXsbIIIPKnxQ//kbHTDtJmPWf9dCeFoGIDzZf6YacAfbSGyZvkOV2cgjogKr0U9gxq4eocapnIoEsGIzd2Dp7bqBd0CtdsfhFgY2I41Sc7wV3BmmhC0dtlloV+zi8EKFCf7tOTl3/XYq/k2rb3y5nkfwjArsZ2P9c2IciVFKmSdWFwYkpzfG1g4Xo17/fJ3D/+XwTCmv9CvnMxphVLY/+qK1kOulNk6ztTn4KOi5VUnVubS5qqyVVglLVxBGp71ATVjF/qfMzvXDxBHtW4S6OrZHSHKnatMODr/YNx/FIasa4R7wa7wS8O6Gf4IafhJBmerPBCaVJQVzmg59fQp5p8oxs451SSiuQ5MyXtjndfeN1B7/C5166x1BbM9+RxRltiLg/jdMlNFbnlLieYsJTplmgbuz+E7GolfHtA==</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
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