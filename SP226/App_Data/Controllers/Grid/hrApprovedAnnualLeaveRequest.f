<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrphepdd" code="stt_rec, ngay_bd" order="ma_nv, ngay_bd" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Xem thông tin phép đã duyệt" e="View the Approved Annual Leave Request"></title>
  <subTitle v="Cập nhật thông tin phép đã duyệt: xóa..." e="Delete Item..."></subTitle>

  <fields>
    <field name="tag" type="Boolean" width="60">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" readOnly="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" readOnly="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ten_bp%l" width="300" readOnly="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_ngay" type="Decimal" dataFormatString="##0.00" width="100" align="right" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số ngày" e="Leave Day(s)"></header>
    </field>
    <field name="ngay_bd" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="true">
      <header v="Ngày bắt đầu" e="Leave Date"></header>
    </field>
    <field name="ten_nd" width="150" readOnly="true" allowFilter="true">
      <header v="Người duyệt" e="Approving Officer"></header>
    </field>
    <field name="ngay_duyet" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="true">
      <header v="Ngày duyệt" e="Approving Date"></header>
    </field>
    <field name="status" width="80" readOnly="true" align="right" allowFilter="true">
      <header v="Trạng thái" e="Status"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ten_bp%l"/>
      <field name="so_ngay"/>
      <field name="ngay_bd"/>
      <field name="ten_nd"/>
      <field name="ngay_duyet"/>
      <field name="status"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wdOzInxo6qywaveVYed4NTvT62w9JGDxXkiynA/wkuI+ZpF8/E5FWVJwA5he3ahNR21OOrB23c0VJmoBIAQBJA=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL754lRuNuvFpF1HNw/sgoZdFOEQkwf4r1BdnbOKDxhow+Ig2fdDciDExXbATNpCFmm582kelMg9sUck6JmlZWonz8=</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevg2BvCQJh7SpyljlNK7fzDhBgAYL+RdNFvuL1xCL1hoPxCMByl52ka8luSEoa6ZtoSLztUTyUxNJejwXTcEb7/hzOamQ1TpVvcCdDlr4LCFeLLsJtDh+7dAQv/lvfkcipDf5+lbBV/HAdNP3uR4Ix1woK59uNlz5z1fAxweNJF88ToHHUh/pIz16YL6uaD6awYCOha1U/Ix2yMnFrMrEMEmd90J7YYgBTYZct3xw8VGP6esfriDheimIWwBbEg5/k8kMVjbzE+m4AmXKEq0+DOs8Hrb+RoffuaODdJQTyGSAP64/u05cZY/RHiABUmthukM8vjtK/EOSPmMxxk4F5FwTUf1kmxYibL9L9EOZ70+2BfdR832dDwx0lZaTTLDPQhocv5fndeYPE3z/tHCu4N5HdbecKLSnyweI3bfpnZLlNL/cYM++W+4pOufnp1NrO</Encrypted>]]>
      &ScriptTagReport;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+C53loe3EHEB7Pgn12hHV3VfFrKMB2VBV1VM5n9deYsMufVj4MMC9Cs+zfb7GbMe2BB6gUAgBSK6e88K8rp0YtwBp3GkGnVF/z5vxhrK4syJoV52T305My28Pvl3wWlcS2to0OSxWzknfIWOTsxeufFlHGIAUn17/Zgyz1yBuNsFGdr7dX0y9/efa+DHWNZX9PzydkY0MjT0pqnUKk7a00=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="TransferLeave">
      <title v="Chuyển dữ liệu sang cập nhật nghỉ, vắng mặt$$90" e="Update Leave Input$$120"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>