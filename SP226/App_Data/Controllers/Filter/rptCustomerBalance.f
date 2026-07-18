<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" aliasName="defaultARAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="(kh_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách 1" e="Customer Group 1"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="Nhóm khách 2" e="Customer Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="Nhóm khách 3" e="Customer Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh3%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="sx_theo" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="0 - Mã khách, 1 - Tên khách" e="0 - Customer ID,  1 - Customer Name"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="161">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [nh_kh1].Label, [nh_kh1], [ten_nh1%l]"/>
      <item value="110100: [nh_kh2].Label, [nh_kh2], [ten_nh2%l]"/>
      <item value="110100: [nh_kh3].Label, [nh_kh3], [ten_nh3%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

      <item value="1111-: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="111000000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 40, 25, 100, 35, 170">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUnU5rRVPTFwMeALn5c1iVKpYGHO34YP/BFr0XC7rM7citFs8s2xW1t3VmjsDbsb/qIl8goQ9KMQTRmCh8WghIT6bh2h5za1G9KwJfTMliCCiQdnc1V0Y8eJoC5XQJdu3CBLZTdWhmaZAVmRepr2CwUYgJW0X5ZRraBTiRssRfLVTKHyQrwJvUMfNxDDrFcd1VcGV0zjFkyd6XMJZEQtrslsTFHvHgthvGipU1/4XXoEMmpgJU72xxlLhDtV7kwDYDnm/pBFmYyyMOqH4NTzGLkugJcFNdyagTLyxOcHj4hC2oaaYvAXFxTlCMNfI2f9fafqpRIktkHfUxalmWLtzigA3UgDHYHvKfAF5Ov1qyoGL6YSbVnmZKr+2D5dx32OowMyU3/TcHR7NgKyRaReRSXgcE9tFpS9nyP7ujUKGYeJCKzaBlbtBm7TMTsKy1OzVPJuMKQ50AJKsjSQm+C3IvOTw==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EX+nmf7EB/LI6C1+yjwx9mI0KiftxZsqI+iHAn1M3wrYF8p6x/72sBFtmGRYp8emKE0M0ZKo3OHxOHY+RF0o2ncOESE/n+g9on0teAUepb8WwsKcchfurjDkh/hlDN5bKP9PtNR2F6Yp7mMAqL6bCbX47wO5ALFYI0/ArN8lwIBmapnhIUO4OBod/OTOuLBdEPj0sE+LOD/xyf4WFf0TrAT2/6oNEN9kVFEJhm6lchdsH3tiifi+0yii521V7iqslBYQqCEBQXZmelxpIuClw2gjvHGZjzMaP5lsnW+AxOFBZFIztqkFVer+7jOvK7g7WDdxX/GyjGdxumDjX3ObjuI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBG11+0Vmf4MKcYZnmyRTS4gQOQXy/OPdbk1KCUY+ozCEXici1bXsiHmr5GlzX2TOLg9oGy/p6kcV2xriRyvxhahGIvCKoqsNpfgwnnC01YjaYKi8bG6YRtRr3vIQfOh4obmhs4coIr/pmlikJlp49YceUos9DJswmLB5NpM+LgPbLBUaBbkS/t+hsqzkSSD348I3uKCg+HFrKH0ggiFMOIMqTfTck+W3vSfBJX4Iy9aCXyJcXzmpHr74M1dkCbbtt5nGzKfFImlgwiVknjBfRL7dRIP1bEEqJME9yLFmLaL/LG/6NX7pG+hVhfmcUGSh1AjdT4y/IwizKltOEoH0j2He4nKWHSQIFJanU9aP+qnVv6/80WYLEj2pksJtN7SRc7wBTKFe6WgL5Fh0uM0BbCBjTommvA4aR5nZAapyhIjSfa/LGkQ4FZWgbDQwLb2L0v+iIz0Aj69FcFKcjWPwTxO/6Pa9DdhUgw+eUuF7S1scm65m06j75tz/2UjNfhSSWFhv7wBZH2JinstS5dJ5lmhB0hN8+9XBvlDvT+RwUJg7YuyVjdMReDgsrDGKMaW6c4HC40tVROlFGOYIbbBQRKo0mxCpdAaJ/lV5F4JbiAnkGy0/bhLptFcF9DQ/O/AN/K9ypDthT+J51Ar0JPxi3IuSYWOaZCZwoZ6EtcZ5AL8LBcawm+L9ExuOX73rECblwn6mO81DYdIGivy3oIXNOjfmSWhReJnw+qMf5ZKxao9Ywm6fF5mfDvuSKLegi0EIVZrlc/SE0TjgGHNQIAvwMlyk0IbbEKYNmZvlLrjWPRQ0FpPTIqoBHWrgoio+XEIZrLib6R82zA3Nj288YJgy9teXi3ZSa6r24hMu0bxzWGLsSosl9IuG3aBlAM83vdCbiG7eanSzdenCzuvAxIvFzk</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>