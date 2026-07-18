<?xml version="1.0" encoding="utf-8"?>

<grid table="dtsocpdtxd" code="form" order="form" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Sửa tham số" e="Edit Parameter"></title>
  <subTitle v="Sổ chi phí đầu tư xây dựng" e="Construction Expenses Journal"></subTitle>
  <fields>
    <field name="form" isPrimaryKey="true" width="100" dataFormatString="X" hidden="true" readOnly="true">
      <header v="Mã sổ" e="Book"></header>
    </field>
    <field name="xl" width="100" allowSorting="true" allowFilter="true">
      <header v="Xây lắp" e="Construct"></header>
    </field>
    <field name="tb" width="100" allowSorting="true" allowFilter="true">
      <header v="Thiết bị" e="Device"></header>
    </field>
    <field name="tb2" width="100" allowSorting="true" allowFilter="true">
      <header v="Thiết bị khác" e="Other Device"></header>
    </field>
    <field name="cp_bt" width="100" allowSorting="true" allowFilter="true">
      <header v="Chi phí bồi thường" e="Compensation Exp."></header>
    </field>
    <field name="cc" width="100" allowSorting="true" allowFilter="true">
      <header v="Công cụ" e="Tools &amp; Supply"></header>
    </field>
    <field name="cp_ql" width="100" allowSorting="true" allowFilter="true">
      <header v="Chi phí quản lý dự án" e="PMU Expenses"></header>
    </field>
    <field name="cp_tv" width="100" allowSorting="true" allowFilter="true">
      <header v="Chi phí tư vấn" e="Consultant Expenses"></header>
    </field>
    <field name="khac" width="100" allowSorting="true" allowFilter="true">
      <header v="Chi phí khác" e="Other Expenses"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="form"/>
      <field name="xl"/>
      <field name="tb"/>
      <field name="tb2"/>
      <field name="cp_bt"/>
      <field name="cc"/>
      <field name="cp_ql"/>
      <field name="cp_tv"/>
      <field name="khac"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL754IWS+V2D/DJPYlrOUK/eSgDxhmTDG6P9j5pe+/0ywkuIx5p1/LkUzIFaLOcziZsUrq5B0sZatREHMKccH+eYZg=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+bkdEO6iKk0ImaVHWQ3sRs7lXNAX29dGcZiVXD8is/+gGZjSj3T6czVchBQy7Y/e2est84PoqTXlwJbIZrsRMM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUV0oTtciE8G29OjoeOK5lsZXKT5nY7SMKxwVS3TY3nFQq4ep1j36rQwAOe+fm8/md2gjNhhPDH6G9/UgBDyTHFaN4OXm/xyuI6mkSx3Nfak5BqxDuO2aIhDWkH6n1z9a77BCRMuB6HZWwtAHjvRuQ9vbaNQT0qRRJQeJ65x4+bndS6M3H1y8rDapZNNz+FxTZY587oD7U2NPB6Ubbxhg/cVcmdJj5QPBNe5aNf/YdTxpcn/z9bUb/qzGoJ2TDFJvDaBAMS3K5kxIQxasNiIDSoe35FrShybb72Shhz+/Bl2SR282SRDR9oyFYDEbQk/fE2bneIXJ95rmVUTko4bVHGuUcW1QYxr/0dB0fb2FF4rKtwSqDpjtCIjXm4oPVuC+z1+PED1amoMfgwVHquE0hU=</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
  </toolbar>
</grid>