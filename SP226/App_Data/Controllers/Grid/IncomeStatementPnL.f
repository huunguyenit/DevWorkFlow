<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
]>
<grid table="glthuepl01_28" code="form, stt, ma_so" order="form, stt, ma_so" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phụ lục kết quả sản xuất kinh doanh" e="Appendix of Income Statement"></title>
  <subTitle v="Mẫu báo cáo: %s." e="Report Form: %s"></subTitle>

  <fields>
    <field name="form" isPrimaryKey="true" width="" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" isPrimaryKey="true" width="80" align="right" allowFilter="true" allowSorting="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="chi_tieu%l" width="300" dataFormatString="X" allowFilter="true" allowSorting="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="cach_tinh" width="300" dataFormatString="X" allowFilter="true" allowSorting="true">
      <header v="Công thức" e="Formula"></header>
    </field>
    <field name="tk_no" width="150" dataFormatString="X" allowFilter="true" allowSorting="true">
      <header v="Tài khoản nợ" e="Debit Acct."></header>
    </field>
    <field name="tk_co" width="150" dataFormatString="X" allowFilter="true" allowSorting="true">
      <header v="Tài khoản có" e="Credit Acct."></header>
    </field>
    <field name="giam_tru" width="80" align="right" allowFilter="true" allowSorting="true">
      <header v="Giảm trừ" e="Deduction"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form"/>
      <field name="stt"/>
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
      <field name="cach_tinh"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
      <field name="giam_tru"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiB1qYWeJMBilQH4XQPOED5NjHgM0tRez6oBmUEocaKMDeCam2H4e/UE/GCKSl3QjOQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNUBrsXOTrexuecQHR5XLyfd3kHcx9PBC5W/ZcNTQHpTpkISQyXMhNQlRuLd4dfJ0AUUF/EsLSDBKP87WxEYYm4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5sPu0yfUDCpjAvvtrbMkG87FZGKBDwLvuaBltt/igPxzcMOYDsg9wM5JfJP3PgoiOZfiPrau1o6dlYOV1C0Q/c9iN3NeSDEYU7tCcjA/LX45GegvVmP8Txa1c/3VFeI3me5etM2GIq4143BB2iUgja+iEj1+kiXKDu9CrCZhWL+yRjXbHmZDMHepUngyqbKw/rLvNRIma4RAcMT7wD9SCI5yeQxn/J0TZYJdiYHLwBiOnAeOtyxfrsZrSFywO0xElX1Q8d08Xbu78DezljIxvz3htA6oIx4h4bVfMc3qMCN4VkU7qNlJey2nhF6O1tgyaquB3UH9iSHwq5W7LYTFfmL</encrypted>]]>
    </text>
  </script>

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
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>