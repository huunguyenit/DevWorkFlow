<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrdcvaora" filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ngay, ma_nv, gio, hs_yn" order="ngay, ma_nv, gio0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh giờ vào, ra cho nhân viên" e="Employee Time In/Out Adjusting"></title>
  <subTitle v="Điều chỉnh giờ vào, ra cho nhân viên: mới, sửa, xóa..." e="Add New, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="gio" isPrimaryKey="true" dataFormatString="HH:ss" width="60" align="center" allowFilter="true">
      <header v="Giờ" e="Time"></header>
    </field>
    <field name="gio0" type="Int32" width="0" hidden="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="hs_yn" isPrimaryKey="true" type="Int32" width="60" allowFilter="true">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="vao_ra" width="60" align="right" allowFilter="true">
      <header v="Loại" e="Type"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ngay"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="gio"/>
      <field name="gio0"/>
      <field name="hs_yn"/>
      <field name="vao_ra"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZNqo3XpoX61x4C/tRBSNe1p8/D20/p8q0suYqMjwJ8iiofxFHtcsgIBV/dCvFo0JhjPw5OqsP5V9iS4zgS8uYuVXlv4XydSQJM2ht77jweqm</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCpAPyfBOmFqGmSMiSrG8gbpL2bi+jnIi6bWuIMwF9AsLkpAG+ujAYTj4mI9awRyekQwuEcqKNnhStvhfWi1o5fzF4OpDgJlmPvODSJoTO4D</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf4JpbTv28KPAiDuflNIcYVPXBCuSpLL4I6q53dxujruhD5A1leKehJN9fSo/3fABssjBIKO0FPG1CYkgmu6IJE65J7pRtXE8/ORhUDEgMooFYs+ZdoIBmfMMjmeagD/ZLBuYwdSDqrTM8Ryovu3ActodY/EAfzj5wR4U6URXcMNIt40uK0dvyUa1Z6H8ziSvAe4FtdJEcbDI2iVkq3YaV8YqQ2e5mIOBQ0CqHI8qC8pELMGcTo3imdPIizUbWECrURRbvfgJjKhY4qQGrRIFuPOgHWvorQgNAPsgeySMt/F584Tj9uGLBjFKGlTuMRRWzbFUh1OqxD1MdxbDHsazyN5+GjGuzscemX/rRPGzxm6/0YUSidMnWpJl369i/LsFA==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6DFfIej1Z1usZCgOhSYRRZYfxpRvE0pRIDthcBTrCh4jEbVcVrTm8SU640oMQmom9dQQHa0WobvQIZe7NxDagJKe6WhvNq7cCJJhgqj0Avb0qUgBYwtADdv/ltSSe1HR0XHnINpYIhRhbkkrboVnpE8+21RFWwHQ7WKJgCR6jiS0JXISAfPnEcezio50FBi3Bwc9Qe7a26ebQdyLJ9IpLc=</Encrypted>]]>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="CopyRow">
      <title v="Sao chép theo nhân viên$$$90" e="Copy by Employee$"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>