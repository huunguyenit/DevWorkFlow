<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
  <!ENTITY defaultTable "BCDTTUAN">
  <!ENTITY defaultForm "BCDTTUAN">
  <!ENTITY controller "rptCashFlowStatementsByWeek">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="kieu_bc" dataFormatString="1, 2, 3, 4, 5" clientDefault="Default" defaultValue="1" maxLength="1" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tuần, 2 - Tháng, 3 - Quý, 4 - Nửa năm, 5 - Năm" e="1 - Week, 2 - Month, 3 - Quarter, 4 - Half a Year, 5 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ky" type="Int16" dataFormatString="#0" clientDefault="Default" defaultValue="4" allowNulls="false">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"></items>
    </field>
    <field name="thang" type="Int32" dataFormatString="#0" clientDefault="Default" defaultValue="1" aliasName="Period" allowNulls="false">
      <header v="Kỳ bắt đầu" e="Start Period"></header>
      <items style="Numeric"></items>
    </field>

    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear();">
      <header v="Năm bắt đầu" e="Start Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="kieu_kh" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" maxLength="1" align="right">
      <header v="Phiên bản kế hoạch" e="Plan Revision"></header>
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
      <item value="1110000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11-----: [so_ky].Label, [so_ky]"/>
      <item value="111---: [thang].Label, [thang], [nam]"/>
      <item value="1110000: [kieu_kh].Label, [kieu_kh], [kieu_kh].Description"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcC0ajKwG1JAEgDVdW4J9b/jX/eSNukCbKT9TijLFd+DfN+CXQBJiC9feHk2W7/xDqs0X27k3L/E4YKzsezjO9GEB7PQ0CjYwG6xeZZh/YCm7icLQVxTUoApAqmVvGcODlrmxvMphm+M21Xu50uKvgiK5W8DrxQ5KVIB/PSLQC3Qf3TYT2C4TNXLwOKfTWCQQVrS4l/UlYq3HZxMVaLds2K4QljZa2CF1kq9qTj1or5TTPAR4xZTaEkygb1g7JTtCq/VwDaTeGwAoqCgBB5Pzu+RZ5y7Df5jZiISXKJDvH6zLSaBWGrhT72IonJ2A6h1qQuG3lxUbu6wpkObaMy7rBpI+7WRxddEwRrCn46/5bv3Dj4dPwrlGSmXEAscyN+A0OViRuvDvhs6SOvuvE87Eo3lIX53sxJmko3waoaOHfSii</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzcgRxuQh6keovaXhyE65GTPgkOM0eWwUraig0e8BYgyj43aPF4Y1nkjNbVtosUQsSvPh8b02+e2SlMUrXEoXA3Q</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L19c0RxTZATwVB2JbEgd4SFLcfeDBef2gtlD0RwLJiZHEiatDUXAJF6mtrTtqSs4APJe6MrkMEZ+J0ovhbU/Lo7uDe7DB1JqXe2+z7EHHvwk5cwUHoMJfEs8vjqDHKJ3JJ3d5HeS7GO957I0VPt0Na66F7m+7PaMN0QuSfnWmwmQo6jRxt2PwfF8oeAVAozsnAzvJfE+SnXiXgOz62nBTyfZO3/rNvqj7djUfLocJ11suLMDvsNurMoFrxRShhQl2BKe/xh0gdomoZsWpYphpL1ZnX+E2pnRMeRBwa/8TUrQ6cv5x3zoHIyuWLrPAIuR9d+lwHki41dE2eum4BEf9WWBSJPfOu0GtOIfMwnIzWXrZtMXPgBFlzoT6r+krXQDXgjAJe7D0I6M1Z5ofedzvDrKw+cPOpYHxQwqfWHbW+wRrqvNiC7eAxOFF3QGPoxl8aGQd0jogp4QSMtVQT2qiIO42MezggdFu0GHlquFDYCLm07CGwiIAyZnSsLJge+RuSpKyYujIyD+C7EbzMdfRngDy/12+eX0VLuVFmdGbsmB</Encrypted>]]>&controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILpzCkSOrZ+kkUnIQTJQ0hg0URE+sXUTaFU6FmKazXaZe7znP4G4JR6bcOOY744MpE7vtG3y0knkmJOmR5AJ9kpxXJP1i46R1o/fs5ZH7JGEpLEqE3J8B5G6AYODBq6l7+g==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L/5KS27KlAHRCfUqi4YicoOHFZKJkHYJZebKpyg3VbOe0mv9I1Y8YclQ6F09W8s1/MSIWY8Tl0Z4ZhkMXWTaJ8I=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L1205K2ivD6vSMbb2mgZE6HTocXf1kMdq130Kz+d1PWeztxCL5PBmZGKM2hyX6uC6h3uHK5NrXczDhgvk41aKqE=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2M5b69WyUS6DP3cdmsFwP89MkmgoXEFxoVRqlPKIJvRVZ/nW3im7h5MVDdchhZKck3QCjDrWlyXNxDlcdv863M2Xv+shkUXQCnDAfQ3d6CX</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L3f0ffKly+qXYrnXzIdsbKOSNYXc5oTyLv54WskRTZk/44Xj8pkI1Ui0Q8+rLinSBBaY0U1vkoljlv06Lrll5IOpOouNu2jqZppTLGwSM4CxzlIeYhrmDSOjuv1TFMJPtAPTweHUeM8RZn7Hv5c3oamIK82bOa6PMEESxVzHx2FU</Encrypted>]]>&controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGBxIC2/52NA9G2vweZ19lhELEyQ7yv4dGGTXT3d/AC8imxgriiNHzFNC2NpbZUAjojA==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&g9+OJ7sPPn5FQW42RgjNxd7qihqBHXyt4TT5JfAyNk/ntWa7VOBOAQ8yEYMUmCoUE1g5s1jRmHrm12kS55Qdqg==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&g9+OJ7sPPn5FQW42RgjNxcfJFlqw/7py8YNHwIg1NbetofxWudTNyaat/2+ngD0Ql40nnuQCZaRGaq5xl7t/YqR6Vn75xgsJvd+qLYYYnrcqLNfweaCgqdKMHkI7wV3kEygiD31l7stLnP0vSlxrtKKSyICxqwR+nT/af0Y7lVU=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB0WzxzSC2vbhxTguC7RIFK/xmseu9lgiVVraHsMcTnFeDp7U1kRFgTCkOlaTEmx4t7cCUNkQDdb+axkbznar/uEFaooJ6jGShSytP5D49AdZ7fPO9SbaGPkfpHnckIWDqODsDgsV99Q7O8hajgD95gidpVwBKN5keFIwPdS6bDDDZiR2QR9X/eIAKmPYfgsfFQseeDVZrsnjic33DAgcE9a5FyDxo658aaLT9eTNpG+r</Encrypted>]]>&controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdr88rAUs4oclX/IVmb2Q3X2l6cQJHWJDVK2GMNehZSyXwuxqSaKzfhPo0t1ysFcCjfu2QnX1pVXCzoxQbhpipVuBGnk0n6B/Q2SCAGOymYPlAAk0F/UUckf+lgMDJwVyAFQv2RlJ8mpfkMK/4DOcQjdKhWrRrp/VG4t9HeDS1VDeE5U7RNXc86gocWbjkmGuiqOR9wwVM/v2OX3fTGidQZzLWluxFI76RoqWtVp0mDG4LqRbuwR8h8K5sHMrkR5hhPWU1TSIuPvldmj7YDKNYJPZXAHlUXd8Op9AVX3masOJBiaL5DOkRN7FrA28EEFu8w==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>