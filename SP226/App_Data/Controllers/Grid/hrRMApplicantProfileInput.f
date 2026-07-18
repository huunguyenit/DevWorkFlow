<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "hrRMApplicantProfileInput">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZ0Rpi2fST1NfK1Qactg3BIeMXG13mopA49yJ9ry/5npiE76hfbQG+UGFs0l5Hpzj++1+3L3zbbnQN5wOWQj9fIDUI4bzoP5WlzluCkCpncEem3TuiRRRHIUGq0NpZ3h+8h+XIwy/Zy1xsuwcQWNWuoEpDuO9n3UG4XEYbVuQnGpxjEQJ/U8ffMDBoGW4HFxYCxrtyPBlVmKYtHeiqrp6/vFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="vhrrmhs" code="ma_hs" order="ma_dot, ma_hs" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật hồ sơ ứng viên" e="Applicant Profile Input"></title>
  <subTitle v="Cập nhật hồ sơ ứng viên: thêm, sửa, xóa..." e="Add, Edit, Delete Applicant Profile..."></subTitle>
  <fields>
    <field name="ma_dot" width="100" allowFilter="true">
      <header v="Mã đợt" e="Period Code"></header>
    </field>
    <field name="ten_dot%l" width="300" allowFilter="true">
      <header v="Tên đợt tuyển dụng" e="Description"/>
    </field>
    <field name="ma_hs" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Mã ứng viên" e="Applicant ID"></header>
    </field>
    <field name="ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="ten_vtr%l" width="150" allowFilter="true">
      <header v="Vị trí ứng tuyển" e="Vacancy"></header>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="true">
      <header v="Bộ phận ứng tuyển" e="Department Applied"></header>
    </field>
    <field name="ten_tt%l" width="150" allowFilter="true">
      <header v="Trạng thái hồ sơ" e="Status"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dot"/>
      <field name="ten_dot%l"/>
      <field name="ma_hs"/>
      <field name="ten"/>
      <field name="ten_vtr%l"/>
      <field name="ten_bp%l"/>
      <field name="ten_tt%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZPGS0yRi8z2G3k8Y6xY1O5qIXGtt//EPBohhaI6g4nnMCWnM04J8UoD6i6Q11TYCpr8cOE4y7w1PXeqweGXKYCA/8Jz75ri+kAhg6tcgzZhij5bm63rYH8LIZC6Xa1vOVVZXoX9LJ1XZB2XpaJCoJYA=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMDUyYviT+yEVfdZEu4QXOtCIVUun9swGWU2YHrvDTVYJxb2okDD4KnKlilen3uP/zV/RW8iKwX4mwe5T/QoKa43bK493pQoRsSZMbj7Cb3r</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXtDRbsX8Hc++QPottlWs3dnnK7WXYhJjEPjT/X7/kOZ9eY0mdkI6vQXKB5/5QuhUzSV8CzVVJQrmqEpU1ag0p1x4vD8FsRXewfhToJCCJQdkRMoQ22gvs3nFJTErrBX56FY1uAbANtrEX0V1KIdcfIEm9ltjMK8uk05OFTolLTsS3XRJUKN7k7LtooYn6sfanC+Dqmoc/L97txju9l5UH1vBHRPU9On16y/Z/K6a8TDkfEuWa2kCVvRN660EkNqylQLES45WHsQIdph9w+scXXR8kILDUUiltxXLPJBglj5qReJOk+lN69wgyRS6SWS2ko9ywslO2t/1Rw5Jeprw9EJuDZ6xviBYBFlIeVbxoCqtjU5E1Xpg0FiUPUMA82px+gYX0JpiHnpa03Xoc+UMIthD9VFxOswHwKGyhsjRiyz5/ZTOLYiwGZqfQlyyPXHzzDW2WrBUloQ+j/Ypup35iKc5v/Utq6oppJTuqC5UoJnyxRlKI0N8pHihCPKHEIrruiXzCIRqTR/9iqPhW/YCp0=</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
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

    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>