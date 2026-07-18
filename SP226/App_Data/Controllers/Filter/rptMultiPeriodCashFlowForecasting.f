<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
  <!ENTITY defaultTable "BCDTKY">
  <!ENTITY defaultForm "BCDTKY">
  <!ENTITY controller "rptMultiPeriodCashFlowForecasting">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="kieu_bc" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" maxLength="1" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tuần, 2 - Tháng, 3 - Quý" e="1 - Week, 2 - Month, 3 - Quarter"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ky" type="Int16" dataFormatString="#0" clientDefault="Default" defaultValue="4" allowNulls="false">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="1110000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11-----: [so_ky].Label, [so_ky]"/>
      <item value="1100---: [ngay_bd].Label, [ngay_bd]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cG4JTXLbN+0UUnLb5+RVLtWM44I/JZ+gl2mcWkLMn7awv8K50OxKzuUvhJ+bar9oH8BISyr5GHhIefYUdemEQ6mgW6cySvv/ZIjrFT4G7qB1TYQpfG4UVCjaca2x1u/Brp</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ/GSHSgWrkiMPNOxkZ6CA5sPfFG04hvRUMj9qz6ZajxKEghjldgyDgw8LfXyxbTyYnkVhq9AXxfIhxQvCQtV7YugiUL2SI0Zj8cokmeT0mNwg56LMbpxilCIE0B8kE52S0/fV6xTVqDE5N5pEDqJtrA=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77V5xpLVeNny0BSZJxXtN3KK7KAisAQ01pw0oJE+1gA53FLJ88zv1l/zcAeMi5Uy5BDuBXrVPpo4G6buXHLyP0eNAMudIoaM+5TpyOFrxjcwazNvjcKpbR1T1gDJp24+KWv4HWb7ygCRO4Uw0uQDj73gBsY4L139BY0nBtjmi0Y4wXVIV/mVfFh/Kt8UjsYHvw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlpv/gv/lSDqjHkFWO2OVMu8swUO/iYonKcmj9Dz5JRnYDLBWN2e7nGKOj3Ks9Jf4ao4=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdqmn275oJpJ4vjI6yXBNmt53HOUPRQXzfP97G9ooeGa4nGskGaQ4Gsq9owho27NGQw==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP7h2GfJqnNKET6itpAfLTfr0RHMn+HY4mTGfVTJzGGnA6N9IvhINBlbMelhjqpGfzMLmD97BCyjFd+UtiGo2pI/2TyXn9voPxIPn4xRpNZHG3VpImqCP6llTPWzjnM/+cPFQ/HENnyaGDNFK9AwYIjHTMXHZ9njVz51MAXj3Vgfas4VWQ9r4qm7hkBpLePm2jHm7eA67YMZ/90t1SfO+9AhSzGiwKjGD8Zxmn90Vu4dB9FPI2BrufZkJZGXGVOqbyPrATk2ExE9dAJ5Sj42YTpDeBoPTVkBJZcxWSiKSmjomNj7GP6kRujCmanwM00p5Q==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX6ss0KvCYRO2QGLSVwbRy0uskm3s115S7YBL8UXifc1VBuD/z+/l+R5DM3pYvlk7Nw7N8XiwLS3Jr0SgGt4LYyxU+OFOq6ZZJs9fWU57A9Rk+g/zxnn0C93eqkDts0pTUOSSZIQo4Kn2iPeMnR0soozCWyOUHq63eOa7ZdZ4y4p3OYiGW0acX7MMiUoD26DJ52avdNbVIIuSSQN7KF9WlsTjsPvDDazPpAkvR4Q0hh8zD8N9wugW4paJEwPaCPwFCm4YM9lSYsJhoOTFJygujBuSibtGKOIw1mbk1swRwBMGYcazFurKbCBWbn7HWJQTXXfLZrnbi0V5X3ijtQUMgUa8vYOBFYb3QDqrvGnLsV4pHKD+sVSZjn/PS1r2PvyPg0=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdr88rAUs4oclX/IVmb2Q3X2l6cQJHWJDVK2GMNehZSyXwuxqSaKzfhPo0t1ysFcCjfu2QnX1pVXCzoxQbhpipVuBGnk0n6B/Q2SCAGOymYPlAAk0F/UUckf+lgMDJwVyAFQv2RlJ8mpfkMK/4DOcQjdKhWrRrp/VG4t9HeDS1VDeE5U7RNXc86gocWbjkmGuiqOR9wwVM/v2OX3fTGidQZzLWluxFI76RoqWtVp0mDG4LqRbuwR8h8K5sHMrkR5hhPWU1TSIuPvldmj7YDKNYJPZXAHlUXd8Op9AVX3masOJBiaL5DOkRN7FrA28EEFu8w==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>