<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY defaultTable "BCNSKY">
  <!ENTITY defaultForm "BCNSKY">
  <!ENTITY controller "rptPeriodBudgetReport">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="thang" type="Int32" dataFormatString="#0" clientDefault="Default" defaultValue="1" aliasName="Period" allowNulls="false">
      <header v="Kỳ năm" e="Period Year"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99MdTRN1j0ZqTmBnewZZs9Wb1a0oW70QnCuKL67gJrkA3LdRyHL1/ikLwtVFWnpU7ww==</Encrypted>]]></clientScript>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear();">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="kieu_dt" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" maxLength="1" align="right">
      <header v="Phiên bản dự toán" e="Budget Revision"></header>
      <footer v="1 - Gần nhất, 2 - Ban đầu, 3 - Tùy chọn" e="1 - Latest, 2 - Initial, 3 - Specified"></footer>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ImDZagNihz57ml8yiZEUOKU/jxd41VTkSPefdhbKq43</Encrypted>]]>&controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILiUfAbmgxY2E7WSI6iF0+voLcfLYN1VewnV6cn6NXJAz</Encrypted>]]></clientScript>
    </field>
    <field name="so_cs" type="Int16" dataFormatString="#0">
      <header v="Lần chỉnh sửa" e="Revision"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""></header>
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
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111---: [thang].Label, [thang], [nam]"/>
      <item value="1110000: [kieu_dt].Label, [kieu_dt], [kieu_dt].Description"/>
      <item value="11-----: [so_cs].Label, [so_cs]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPCVwVvCznjQxj9bqmUxCvi1Mz75bHegER4CiGtKL6dEI7VgBdoMGPG1WBaLx2W6U2pFjvQDPcA+Ujaq1/dPzkSWBWlEql+snnhvy4uMJbZZgXu/kHDqXaRob0cFs/BdIwk3y471C5iIwADNkrDJ0OMuKJauxdRsl/Dl7OEai5T6</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzcgRxuQh6keovaXhyE65GTPgkOM0eWwUraig0e8BYgyj43aPF4Y1nkjNbVtosUQsSvPh8b02+e2SlMUrXEoXA3Q</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L19c0RxTZATwVB2JbEgd4SFLcfeDBef2gtlD0RwLJiZHEiatDUXAJF6mtrTtqSs4APJe6MrkMEZ+J0ovhbU/Lo7uDe7DB1JqXe2+z7EHHvwk5cwUHoMJfEs8vjqDHKJ3JCDaouPJgdiW2rImc+oClLFZ2n38dQpEcrGblit2grhkgacXKy01rrteSDq8gk1G+qY0g2PlCHhEOBk7UVa6Gc94QpHzjaMxkRninvzKLCuj3nxfaQq0aWMu30t8iElIsD25iC3m12UMDcSC8d9JsJ8m4zEtJbd0Yen5t3NBlHI8tapcdFKpe5TXxslCpdYDoBG58YouCgmXd63p4kyA8E2TQ2lq+NR6REhrIu5ev0ydxeyvb6gZVpoXIYOKywqFEHY2cf/YZv3GCZpT8zb/e+pD9dJzUls0oWinuqRj/5ooAX9rBj3Q42b4/KSAuW3bnm+Y1cYfnQQo7VCvmOaoWz+nWhZoiH+guH7dAOFFYqk6TsEP90GI2F01XJir9kcz+VvowmZ9YAwsUFS9ft7VqrUI634sNyuyHPgmOMYs8ahHPh69zzYZ9fqO76cPQCs/jw==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILpzCkSOrZ+kkUnIQTJQ0hg0URE+sXUTaFU6FmKazXaZe7znP4G4JR6bcOOY744MpE7vtG3y0knkmJOmR5AJ9kpzgiUft7XdQ+vJZPvEt6ZrfTTlFO+edfbAKTepJII6QGQ==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L/5KS27KlAHRCfUqi4YicoOHFZKJkHYJZebKpyg3VbOe0mv9I1Y8YclQ6F09W8s1/MSIWY8Tl0Z4ZhkMXWTaJ8I=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L1205K2ivD6vSMbb2mgZE6HTocXf1kMdq130Kz+d1PWeztxCL5PBmZGKM2hyX6uC6h3uHK5NrXczDhgvk41aKqE=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2M5b69WyUS6DP3cdmsFwP89MkmgoXEFxoVRqlPKIJvRVZ/nW3im7h5MVDdchhZKck3QCjDrWlyXNxDlcdv863M2Xv+shkUXQCnDAfQ3d6CX</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L3f0ffKly+qXYrnXzIdsbKOSNYXc5oTyLv54WskRTZk/44Xj8pkI1Ui0Q8+rLinSBHUPutoFj2KotbXeEoAsPGKzCkRfX2jApI5ozNDCwK/jmdpN1gOR4yKNUHqDaWLupCHSlx2zZeONub6Eht5PRQTgoU2DeKxLqpFx6eVrJ0Ji</Encrypted>]]>&controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGBxIC2/52NA9G2vweZ19lhELEyQ7yv4dGGTXT3d/AC8imxgriiNHzFNC2NpbZUAjojA==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&g9+OJ7sPPn5FQW42RgjNxd7qihqBHXyt4TT5JfAyNk/ntWa7VOBOAQ8yEYMUmCoUE1g5s1jRmHrm12kS55Qdqg==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&g9+OJ7sPPn5FQW42RgjNxcfJFlqw/7py8YNHwIg1NbetofxWudTNyaat/2+ngD0Ql40nnuQCZaRGaq5xl7t/YqR6Vn75xgsJvd+qLYYYnrcqLNfweaCgqdKMHkI7wV3kEygiD31l7stLnP0vSlxrtKKSyICxqwR+nT/af0Y7lVU=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB0WzxzSC2vbhxTguC7RIFK/xmseu9lgiVVraHsMcTnFeDp7U1kRFgTCkOlaTEmx4t7cCUNkQDdb+axkbznar/uEFaooJ6jGShSytP5D49AdZ7fPO9SbaGPkfpHnckIWDqODsDgsV99Q7O8hajgD95gidpVwBKN5keFIwPdS6bDDDZiR2QR9X/eIAKmPYfgsfFQseeDVZrsnjic33DAgcE9a5FyDxo658aaLT9eTNpG+r</Encrypted>]]>&controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdr88rAUs4oclX/IVmb2Q3X2l6cQJHWJDVK2GMNehZSyXwuxqSaKzfhPo0t1ysFcCjfu2QnX1pVXCzoxQbhpipVuBGnk0n6B/Q2SCAGOymYPlAAk0F/UUckf+lgMDJwVyAFQv2RlJ8mpfkMK/4DOcQjdKhWrRrp/VG4t9HeDS1VDeE5U7RNXc86gocWbjkmGuiqOR9wwVM/v2OX3fTGidQZzLWluxFI76RoqWtVp0mDG4LqRbuwR8h8K5sHMrkR5hhPWU1TSIuPvldmj7YDKNYJM64iWRasscnZsXkbYc96jk/VTJjpsNycGHZhAVWy6z8L+6ObvQr0w7Rv+DfoSniyFR4yMh9iLFJKxWK/e2vBHdjvhpLm7jOzYxii6/Rg2rrd9bu6+JC6HLf91OhZPja1ZD61tVJvYkIgmEf55ByMPxGvRhDa3zTnXrhX6gOQswMQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>