<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="ms5$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="SF5" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phiếu duyệt chất lượng" e="QA Transactions"></title>
  <subTitle v="Cập nhật phiếu duyệt chất lượng: thêm, sửa, xóa..." e="Add New, Edit, Delete QA Transaction..."></subTitle>
  <partition table="cs5$000000" prime="ms5$" inquiry="is5$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nc" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ten_nc%l" width="150" external="true" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Người vận hành" e="Operator"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ca" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ten_ca%l" width="150" external="true" aliasName="c" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ca" e="Working Shift"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="sl_nc" type="Decimal" dataFormatString="### ###" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Số nhân công" e="No. of Labors"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" clientDefault="0" readOnly="true" aliasName="a" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Số lượng duyệt" e="Passed Quantity"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ghi_chu" width="300" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ghi chú" e="Note"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_nc"/>
      <field name="ten_nc%l"/>
      <field name="ma_ca"/>
      <field name="ten_ca%l"/>
      <field name="sl_nc"/>
      <field name="t_so_luong"/>
      <field name="ghi_chu"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnf6A6VZl49REtA7Yr9/6LXK/KxTV9x47lwiLOZsneyNhxlWfoWmoiFWT4WRd3/UMpDIa1u0n4pYNQ7SeROHII1zzjKJx80QTrQ9GOAG8EZfHHMDLp/cZfHd7soezqPP8DyeBqz1l0WdwU6qbr6b6blQtiKg8ZETwfwaq/bhpjpY+6YaxdpdTUa7Me8vOzp4xg4dvle/UBXmtThoHFAKOxVxyheOM/pO9dcu5qTtvmlxVJYSSQ64FMnuPb6BfrFgoQuXFUwf1m6zi6ormo/lKkk1gk0YCt0p3RDEztQmgaa3tGlEzFUme3dUR4k2jMwjdn1LPHa92VT7kE8Z8SSnHNFZ6eTSDzrcP4KefEijEd8mB8EXPzCmpdOYLeiZGfh1DCjrPbeaA2JLi4FEc4bxLHkwR8ZiF26fgy5zyjeQUsyNMEfE1n80t+qrOd39ho1JTRgNdhNPPZt6kZhOc90jffJ4GtdEAVGReIC6OTP9LBwy9c6koSGETZrylJ+hGDqumxanZmKAz/SB2xxvXStmQb8moej5W3Is8y/yOvIKhThbJeYo5HvTpnS6CGb/dE7d1k=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSHyCuWQdmLNZRf19Z2Va00rV6QK7Wnp7CCca1xdwa7LToai0aNDAc+oX4dWQeHfUNX37iDp+Q/5NZ1Zd0OC8tKbkSfxajcX7cCBMKyXfFEeWQsMAz0x04zDkhgGnBXHI6WiG452YjXOLwSqh7XP94/njVMC0eTBFH1QguhZT2XvpCO8NKgHDapYobGOBKQQnbl7joKpaOhLKXQL/FBJcd0OD9LaoRs6xOOABWefECnZdmAyPuYXHqR7+rw9zKHhY8IQfe7TPpcYWiXmd5zJq3j</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssRnq9m+Yg+ZVIAkTEZCcTnRdbJcEN1Yk6IKN1GV29+NECWQi28XuJPDBAafzN2MWRl30Dbe6jP6XCCGHAHCmDNQRRCv6yBfwQ60pJPOaSZQSAyGO2ZfHqBv8dXvB/HIBkNSBhxp2T5uh0u0/dC5Jxj3xzlP046DtaBVE8uCFCBIZftpQ2S3GVtbv5IqOcNm/EUD2Qu2mCpocLUGYB8CK8KNcuZVQfT0BNMvRNOzTzXr6/vLeO0oVkD3wbmTXMGK18OsWOM8PVCfhzp2+QzH0jAUK0kcyvBbgSUpBwdGJV6fQ8ahomc4xTHc9oBv024xQBE84G7y/+NcuS4XMt9bxradKjM9pA5hpFAlolcvzETgzylPC8hlbLAXBQ72Bw596kNFwXGRjGxSUkSpuvwi81Mh</Encrypted>]]>
      </text>
    </query>
  </queries>

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
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>