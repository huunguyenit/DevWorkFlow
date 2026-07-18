<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="ms6$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="SF6" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Giao dịch máy" e="Machine Transactions"></title>
  <subTitle v="Cập nhật giao dịch máy: thêm, sửa, xóa..." e="Add New, Edit, Delete Machine Transaction..."></subTitle>
  <partition table="cs6$000000" prime="ms6$" inquiry="is6$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="ma_px" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Phân xưởng" e="Shop Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_px%l" width="300" external="true" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên phân xưởng" e="Shop Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_lsx" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_cd" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Công đoạn" e="Operation"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ghi_chu" width="300" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ghi chú" e="Note"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_gd" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã giao dịch" e="Transaction Code" />
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_px"/>
      <field name="ten_px%l"/>
      <field name="ma_lsx"/>
      <field name="ma_cd"/>
      <field name="ghi_chu"/>
      <field name="ma_gd"/>
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
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSHyCuWQdmLNZRf19Z2Va00rV6QK7Wnp7CCca1xdwa7LToai0aNDAc+oX4dWQeHfUNX37iDp+Q/5NZ1Zd0OC8tKbkSfxajcX7cCBMKyXfFEeWQsMAz0x04zDkhgGnBXHI5o3CxTzDZwND3dwleqH/k7i9UHaXWybd1hSOwYaZHMVfxmw7HaN6bQdd/qjzZK+qfAhKdzQj5c9C+79n+xkT2ZbSPeaPwOXcg9iJK8CKc781x+vNzvVf748FUYfV9BY0U=</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssRnq9m+Yg+ZVIAkTEZCcTnRdbJcEN1Yk6IKN1GV29+NECWQi28XuJPDBAafzN2MWRl30Dbe6jP6XCCGHAHCmDNQRRCv6yBfwQ60pJPOaSZQSAyGO2ZfHqBv8dXvB/HIBkNSBhxp2T5uh0u0/dC5Jxj3xzlP046DtaBVE8uCFCBIZftpQ2S3GVtbv5IqOcNm/EUD2Qu2mCpocLUGYB8CK8KNcuZVQfT0BNMvRNOzTzXr61WazO00XXiwyEWufAKErZk2cmUWaaRoKUvNmGgoNHe7PphPhNoTprBphukqIYpDc7RKkxXI8mYbI204cYXhbeKLQvzuYohh2HTggKGsLt4bEFkKpYWs1p7eV7hG8zfMzojNQHrtnT7GCL9YO61bwzk=</Encrypted>]]>
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

    <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
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