<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrdncbh" code="nam, ky, dot, stt_rec" order="nam, ky, dot, ma_nv" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật danh sách lao động đề nghị cấp sổ bảo hiểm" e="Employee Requesting for SI Book Input"></title>
  <subTitle v="Tháng %p năm %y." e="Month %p Year %y."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dot" isPrimaryKey="true" type="Decimal" dataFormatString="#0" width="60" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" width="0" hidden="true">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>

    <field name="ngay_vao" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày vào" e="Join Date"></header>
    </field>
    <field name="ngay_chinh_thuc" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày chính thức" e="Official Hire Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="dot"/>
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ngay_vao"/>
      <field name="ngay_chinh_thuc"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZAGZHYnTSJrZIHF0/kH1khflwKn34KXBNDpsOqhftdDwvWBp/ad0pfsStDp2FxSsomD1o04s/iRhxeWxTIr6loEuQuiIhWTdZyj9WJqXbYUOJNknRYqqJM6Orn70nQ1MrQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKW+kWIzC7ACn1FzNy1XLHkP0wLiEJqyWr7QgH3vxRNyGpyWFAcOIkRGZJp9VEhc3FJ5D9urng+zVMAskqJp9zT6mvMiUBfJGpOArtYq99CkzQ==</Encrypted>]]>
      </text>
    </command>
  </commands>


  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXG9pZMCC1IfWBprRVLkU9rQTN2YXQN6kswZ19WxUjRCkhHdN2Q6ga22FJXMHjCGNiI5ItaBxdijfyeuqAGNEr516FIDTwxeZdL65lRSR6LdFvDa7+lStf5bjGLf7FCqyTPcgHy0ec9xubg0cYjxC8+1uoL/u81AuFVhWD3RUxiy2qtiyEdVRTIs14riUI1rvSlYbwYvSbFf001/2EB1fmpggUpjGwxvRz1d0b1Vng2xYPzJ5EP/TP8lUv2yPvWlkTqi75IbvDUNZVNBVGNmF0JjWwZsycoFjTGiXqpf1h+n0EKhBt/JC9VJyOezvZ+iD/g8OSxETOQv5euNiNJbjHOso50IqbcOiHjJRaEsQMxaSVEWnYXqwBRuQGZYTVOpcdWeSgLhLuzfFigD7kb4SPA6ypYOwzBbnajzIJ9Ogzvo</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy8OFql9ak5+K1wPY1SjWoXZPEp8KZbJeXmX9U5h2TDr1H+bnZHxY0Il82OZNzaKCD0UvCVUkswIeRKOtENjrtfYiRl+rU8gBoQDycfhk8vB3oFRevOyyaJ1oyvJlrmqgdZ57LRtnRYBaejSwkCDc7NbA1hw8eP4WRx03yEzELdtLARQY+R2az4diz2kUooiS9tk5E6TGRFHzAC3IlUOZtQ=</Encrypted>]]>
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
    <button command="Register">
      <title v="Tạo danh sách...$$90" e="Retrieve Data...$$120"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>