<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdmngaynghi" code="ma_bp, ngay" order="ma_bp, ngay" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ngày nghỉ, ngày lễ" e="Day"></title>
  <fields>
    <field name="ma_bp" allowNulls="false" isPrimaryKey="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_ca" allowNulls="false">
      <header v="Mã ca" e="Shift"></header>
      <items style="AutoComplete" controller="hrWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1" information="ma_ca$hrdmca.ten_ca%l"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cong" allowNulls="false">
      <header v="Mã công" e="Workday"></header>
      <items style="AutoComplete" controller="hrWorkday" reference="ten_cong%l" key="status = '1'" check="1 = 1" information="ma_cong$hrdmcong.ten_cong%l"/>
    </field>
    <field name="ten_cong%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="#0.00" clientDefault="0">
      <header v="Số giờ quy định" e="Regular Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="loai_nghi" allowNulls="false">
      <header v="Loại nghỉ" e="Category"></header>
      <items style="AutoComplete" controller="hrLeaveType" reference="ten_loai%l" key="status = '1' and tinh_chat = '1'" check="tinh_chat = '1'" information="ma_loai$hrdmloainghi.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" allowNulls="false">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 230, 0"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100---: [ngay].Label, [ngay]"/>
      <item value="1100100: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
      <item value="1100100: [ma_cong].Label, [ma_cong], [ten_cong%l]"/>
      <item value="1100---: [so_gio].Label, [so_gio]"/>
      <item value="1100100: [loai_nghi].Label, [loai_nghi], [ten_loai%l]"/>
      <item value="1110000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIfzMW4BIo4CWhuKlHVVBV2s9pQivRR/DJT80PN8neVhspwOoq0ja6969OmFj3KyGVgM/NynHAdbCBBigbZzKU7qMOXg2Bkr3Deuuka4miwAPKXyo0yTqVa8ZMj7olNBxGCq1eFN+XYxE6ELeAHEnCyqbzD9q9KVNAy7mDVU/9nG4898F0OhMZ1xXnHk2raOLn87NWaqVNSjVMUkE4ybIU8oaKP6Jrw/fwRaG7lPY0Ic8OaMLt9fDTqVultlVXWgtaylVI7FvskPyNPBNmHqiwrwWJbPri/iIhJPZaHnP2lITK6da27+HYhRcEm7gqLSgzNU+PTa1ptSxAYAOCtnS5q/4E8oZ6nfEPowH8mMgL2z4=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgaxgQqCaIEpR8DFYYzKB2+v+irrwNaChil97Zc/bkK5kxpnabRH0gNqIlxA4yKQqEXDSQzXYuYExlokGIGkmDaz/iivXBhtEbq4DrlFmDh0vbrimzxXq6dP0P+IQeQTMKkudfSGQP7ccU0AFmo2WEj8c5BME7WhmqpeJEvnttKKNXmJo/4JIgZnd8oIXiQKoifPrIj5IAwZOrElLbGpZKo+Wzu4FpzWBYBsmwUVFe08k6I9FvVX2Iw40c1h+u0lrGXPtf4Wgu/WNRqC9wb7+ENM3</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8iU70fdajTfRuuvqET9HdOodxRf8J1XWcD+6UYAB4NIGbJxXsR4NRMqLRI9h0BBdIBw0OXBx11l4yvtlV/+2squeYGIV/ZliOTMECYnf35wlFyMgvquNHoCsgamxFnWygOuag+18mRkjeUgu8EwNxZLGR919LpfT833t1rzUaf4rY/jmZT4eJNAnXBHv7r7DFoQzAGH0vUhdNYkgNp1eyvH1cHtE/dQwfJpT2ie6ybO/TRVlopFvrfcV3n7V0nfdQmcT0WkhlbcN/kMtSE3KEAvyv4OHLzkLkpuJWxmYPrZbdzp1qOnmMn394y909fTQggrHwRhDHPn63uuRWHZWux</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwY3fuF+KHCVRrWvKBm8OHa3sbFbv8S4I7/RPeID28/azdkMLHq26mU/7VKEiFq+cAb9evRl/QjQqnmZLyrwY1pPheHP9xF+EvqbWmTRihP8qvu6pktPBGgaHPnN40qAwQ==</Encrypted>]]>
      </text>
    </command>
  </commands>
</dir>