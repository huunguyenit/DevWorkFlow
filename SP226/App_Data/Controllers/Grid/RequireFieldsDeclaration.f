<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Controller "RequireVoucherDeclaration">
]>

<grid table="vdmbbnct" code="stt_rec" order="ma_ct, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo ràng buộc nhập các trường..." e="Validation Field Declaration..."></title>
  <subTitle v="Cập nhật ràng buộc nhập các trường: thêm, sửa, xóa..." e="Add, Edit, Delete Validation Field..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>
    <field name="loai_ct" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại chứng từ" e="Voucher Type Code"></header>
    </field>
    <field name="ten_loai%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại chứng từ" e="Voucher Type Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="loai_ct"/>
      <field name="ten_loai%l"/>
    </view>
  </views>


  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL750YYwRRaIhzcbxF9ZSFhGtVCqU+r3wGbE1WK9c4Z6b0If77fp3tDqID/aq5caDtH6uBDiOlMFoc8+rt8VnUKWMg=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL757vdtd8w1M9WSltN1WvUdr0yuzGhq258o1up3xw7YQVjyAduyAIq8paV7JFGjwVrdcUIbtjwAy2j4gzW72iyiFhXCpCbrIioRMcM/IzCeaX6</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQADCNSu1fYMxsq3n2J2xL6a/SRlIBLUk17NWq8iXYhy+mG2n6yqUQ2gMG15Eq0ibBqlsYIrXk/uwMlt8WhRpGHPaWSFpZaXoJynDTHPwHVe9mWVK8KqDV7bxcUOpXtSq8wRUxRw9PwByufo65NfrjEu2yV2Ou12PlLacJTCJOd3GmkC9tgRP+1ZZs3oHtKwalQ0wVL712+ngpY9FY8I6I8T8FQIPJOHLeriAPpOYvrbK+LRSPnNIdaLviKjhZDlzAc1Dg7MXGx1k1xaypDmCBqNkddytobt5XxL1KBFr5k/FRUYVqyTCTQ7DeygAwOdGZZoqsSylhqVHzD1FlDsSMvJ8nu6Pzdo00mSfml13ahm+vjDTnEhny6uCf2UhusgUCJ32GPhPeXmEPZgcaOT98oUqHhE4iFRYbFYLvS37dY6Pb4YSB0UqpU1G5be7iMMBW9OHS38hjjiNRyDfZjPvq2GIBu+mbcFjZDff7qhE5iPpqgWDV9+vN1sH4/dvHy1i7JyHMN/DqL/JF8gvmhoBWhRf5R+EXuAHIRYLFYmX+rUCcnuIQEb9sCAO+2VSr8f4XXTf9mWJ1zOEFMAIfZce71CmrUAqYRg+U7clORX8dwVwcpv+iFPad1u62NaRWlRXuuZW+uH8D5fAhlDedFcdhpaVxT9GTLVS7+xksbNLFCanOrneaesBBjK9TDrPVEBmx6ErzxuWw/vvJgrPRrQ2lAdfGYVBXvsp1/lccLwK+KH</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id ="Apply">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys19fJW8PyzUAgJPgjLg1obqydUr5OOU7urLAbnEJiGdPBCuhdikOgRoME74MaS0g8MTi5IwFdBtNNgtSlBt9ryNKwDD2uO7C/f7KMwciPB3zXw=</Encrypted>]]>
      </text>
    </action>
  </response>
  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu41Qv0od1o/Kue53SnlWsJOdu0z89nSg23zKupbXJrRFSEMU5u39FDK1yCyTc2hoS1t04e63Ec8C+9Eh0Aw/EPHQaDAqNxNqyG0sLRg3CAHGzoCJZmFhfC4sUkWSpus18FPmr7TdIeJ2Y9mWaGrTA+q7RUT5PThbgpOzRDDX9exZUxFjLnxrvNxG1SNDK70+7g==</Encrypted>]]>
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
    <button command="Apply">
      <title v="Áp dụng$" e="Apply$"></title>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>