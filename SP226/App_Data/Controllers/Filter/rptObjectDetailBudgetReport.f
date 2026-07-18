<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
  <!ENTITY defaultTable "BCNSKY">
  <!ENTITY defaultForm "BCNSKY">
  <!ENTITY controller "rptObjectDetailBudgetReport">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="kieu_ns" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" maxLength="1" align="right">
      <header v="Phiên bản dự toán" e="Budget Revision"></header>
      <footer v="1 - Gần nhất, 2 - Ban đầu, 3 - Tùy chọn" e="1 - Latest, 2 - Initial, 3 - Specified"></footer>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ImDZagNihz57ml8yiZEUOKU/jxd41VTkSPefdhbKq43</Encrypted>]]>&controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILiUfAbmgxY2E7WSI6iF0+voLcfLYN1VewnV6cn6NXJAz</Encrypted>]]></clientScript>
    </field>
    <field name="so_cs" type="Int16" dataFormatString="#0">
      <header v="Lần chỉnh sửa" e="Revision"></header>
      <items style="Numeric"></items>
    </field>
    <field name="xoay_theo" clientDefault="1">
      <header v="Xoay theo" e="Pivot by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Đơn vị" e="Unit"/>
        </item>
        <item value="2">
          <text v="Bộ phận" e="Department"/>
        </item>
        <item value="3">
          <text v="Vụ việc" e="Job"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ImDZagNihz57ml8yiZEUOKU/jxd41VTkSPefdhbKq43</Encrypted>]]>&controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILiUfAbmgxY2E7WSI6iF0+voLcfLYN1VewnV6cn6NXJAz</Encrypted>]]></clientScript>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="Lookup" controller="Department" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_vv">
      <header v="Vụ việc" e="Job"></header>
      <items style="Lookup" controller="Job" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="vvc_yn" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" maxLength="1" align="right">
      <header v="Cộng vụ việc con" e="Including Sub-job"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"></items>
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
      <item value="111: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="1110000: [kieu_ns].Label, [kieu_ns], [kieu_ns].Description"/>
      <item value="11-----: [so_cs].Label, [so_cs]"/>
      <item value="110000: [xoay_theo].Label, [xoay_theo]"/>
      <item value="110000: [ma_bp].Label, [ma_bp]"/>
      <item value="110000: [ma_vv].Label, [ma_vv]"/>
      <item value="1110000: [vvc_yn].Label, [vvc_yn], [vvc_yn].Description"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6KyaoPMZmWn8T0DqyqLtILPrZgSZfM+ew1ymu8KHkFyyl+8zj3fFIE7BNKV8YjhSEP54ldCf3GN+onCLMvE8M+DbrRu6Yar4cymUBoT0M+GPvkqB6p40CJyKYtgWCxPKJacna5b3U+9gSCZ3sIMBEiJQHWZMyNTy9GnVJGKHh/YA1AEaUPaHxRM+ZMGnJHbrio+bU0pZwVUauUPTgS7c9YLc9YE23gj/aCl3Z6AhDb93OSx1mscicMyin7wshWZrOYpllYKZE9xMBhDvsxl+pap1Y/1zuMgBSL/5TOIbNGl54VEKmyjkXNSxPuALvzdaPRQXHQrp+DGl+yQCiVl+vmhT9pvouClF6XqbSS+HBAEQRL2xuj5sVQ3T4bwL+zxLp70eta7R0pUY2wyn1fHMU8YoEGRXR+DtEaQ5adilNnIDl36KHtytRlQbuWP9ZykYA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzcgRxuQh6keovaXhyE65GTPgkOM0eWwUraig0e8BYgyj/e2TpEIhH7B1dlAs1BkqQtBXT/eUZoqY+Vb9biZmkQM76rgJSz1pkuz45FR/am2idwYDin+0lcUHsysCvPvM3l6uzBN9Co6/Mxx0UFy/xCrpCkAVqBLu91KBySYCtqP0Hjn+w7kgPxCxCKnUC8tgfKOJOukhyqrRHqYsWkWkv7nS3roh8QpPV1BXnoypQIQWSsAIkPxqpwae4u7xJmCstA=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L6xFWmmuiSH18HgmOpNaQzPzmdA0hexflBHyrQSOASgX</Encrypted>]]>&controller;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUpeDnaqmXhdQcZ9uxpaNJsLAJdM6nbZqJXtJSEJE6T69JjgYF5Y7xe47PHZMB2OkRqEi5MbDKiLlTkflznXkGXf+gS54xgPyHLBbPB0xuLTgm+95ge2p15K6hWJNXHBQ9Poq+jDn0R27a2gq93nrraVoYY6tJwQvrGKk1OywuOVNT8C1Th6dzYZSFsW6rm+4ztnSGUmHAbCpwg2oTqaD36y4icr54p1XEE1Mw72r9B/+0fV6XaIOsnwfOcCKi1SDw7uVnI3n+GkC8+Muzdf4be47hlfukl1DVEUZgpMKgxoUi27Au2IlxaY51hvWLU1XiyAVsUdlNMNKaGY1jIYiydK/33FufhcKDrXVzmQI97LJb2ql16GkerGPhCGMctAuajbVZGHrCWUcam5OuDsR1knHNBmqMHSY7ujUKUjOlnyQUqBYQU7ih4A18s7ubFEBKBBAKaSdLB6/dx+ruw1ys/FB2rmoppuUfHhuf6BVoCRMO+ckmY+jImHHRs4TOte6OViXw7WvWQCXxipFin+S123h8CvJJDca8ZIh4TJjSjiTa3T6FvDjXvUroNZiwM7lmW9vln9UXYRcQW6phTXv3sIJahac4yuFiZFox+GDisox</Encrypted>]]>&controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILpzCkSOrZ+kkUnIQTJQ0hg0URE+sXUTaFU6FmKazXaZe7znP4G4JR6bcOOY744MpE7vtG3y0knkmJOmR5AJ9kpy6yrmjbihFPO3g71///+sLEMbwbNNeKzw32UXAe5Lg9Q==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L/5KS27KlAHRCfUqi4YicoOqIg1WgnofeAvBgI/mRK31Oljyx7jg7KQUm2Da9ns8pS+MW53tv+1ldiy/8OmHGNc=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUnHxRMhfS9j2qycfgxM3CHq6HExQBOxQw2qGL4rCNFioeRSt6+r6L8CwcnveOmRo6KlIXGNmgOO/YzLyXmQUbMmDUWjhylwDUWpD9X71V2EC</Encrypted>]]>&controller;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUq+6y1r6724p2uwhR1wgPm5qy8gakC3SuQCHSu09l8JFu/dGtt+KZYRLK8nGDniPmquqFwRm3gjMlp3Bk98UT68=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUvqJ45IIO1WzDwj3XOSHYBpoGraKmu4VGTQFdv+8bXedoI4SV2wJZOkTVziVFXHAqOaMoiz7yH17KGnbLcnQ4fTpoRTajSJqP+a6oXZCbxXZYpQQ95h+Z/h1X6EEFADhpA==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUoBZp6NxSHRk2yXuowYFKXII1qbtj433mCcfkpk9BosM/pmKB2E41XZd56cQ99ZZgXbqUM6/yKZzF1uDWPUBOl+Va8fNi/SVDC8iCWMOz+11c81x65zayLJ1y69RbRegyHmwF5Gv/gqJ8qExduXmn0Q=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdiNc7AY4flSD4bqxEUTbY38MAwxH0hy4Lzy0rqAfUxrI0+ZtkTSj85qcYPN8dZ00SA==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB8xtdQ3LwFHRUPHua9QUgcIx/Tk/bj6BB8JDZlFV3Yr1rwNJuXkGrgIGd19NDeQ6bQ==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdiNc7AY4flSD4bqxEUTbY39wHy+Ck9Hsf5dSRlAQXvR8N5u/5kSVNg09g1BVtF8i2w==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGBxxK03DQlNLzK7wGQk4WekcvraSUhkgqmTqa2HcI8TQFaoIXu7J1EIZcLbfTo6HOTg==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB2/vZ06SSyR6iR/roWpCN+mHV4mP7XSgFqtV/vXa3CYuFWHHr5wTfXer9OswiHiZnn+Nn0cfbdsu8uxvBHMNIJg=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L1205K2ivD6vSMbb2mgZE6HTocXf1kMdq130Kz+d1PWeztxCL5PBmZGKM2hyX6uC6h3uHK5NrXczDhgvk41aKqE=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2M5b69WyUS6DP3cdmsFwP89MkmgoXEFxoVRqlPKIJvRVZ/nW3im7h5MVDdchhZKck3QCjDrWlyXNxDlcdv863M2Xv+shkUXQCnDAfQ3d6CX</Encrypted>]]>&controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L3f0ffKly+qXYrnXzIdsbKOSNYXc5oTyLv54WskRTZk/44Xj8pkI1Ui0Q8+rLinSBNBl0cWjE6YKr3xK0xAi5si+n7VvQLjtgBx4dxUKSkkMbY8skaxoab8vemrG2F8IMW0Fo7Iaxan6mWnZ32AhujCs8qACgrD1IugymcgpxUPX</Encrypted>]]>&controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGBxIC2/52NA9G2vweZ19lhEID3q7hQ6G3OiFm15+8j191AGK6420EDtfIs2PVBvOjBTy9MfLQH1QFq25X3yE6elnK2p89VnN7D6hcd8ktBszK2q7mUgqe3CboD68ytlmHwS0y4yPtHthUNV6AmD2dpDoJMBS6VvMuQOgC4zn0yp2tQ1o6LSTITOdiZZV8G+novA==</Encrypted>]]>&controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB0WzxzSC2vbhxTguC7RIFK/xmseu9lgiVVraHsMcTnFeDp7U1kRFgTCkOlaTEmx4t7cCUNkQDdb+axkbznar/uEFaooJ6jGShSytP5D49AdZ7fPO9SbaGPkfpHnckIWDqODsDgsV99Q7O8hajgD95gidpVwBKN5keFIwPdS6bDDDZiR2QR9X/eIAKmPYfgsfFat1/QlZA/btfQEBjZiknIxgI0lyO2xpchSVn9fxyyoi</Encrypted>]]>&controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxds7HYMfncNJlyUdro5OJPHC6Uo65TKq84NcIEGdajx7SiJOQ4Rl5x+QJUEFWS0qlTzcHEpx/6Nb1+fYO+wqszqELt0zAUhJVBVfR+bDvInY0TQ0iCWaAs1VtvusR654VXO8GE0fWz0AvQMdI0WYpEEceuN0cI/LGRi23pPF3pzPzuSc4qfR56ywSiGCl/dL615lfsYyrBMd8OtTtbMDqmJA=</Encrypted>]]>&controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdr88rAUs4oclX/IVmb2Q3X2l6cQJHWJDVK2GMNehZSyXwuxqSaKzfhPo0t1ysFcCjfu2QnX1pVXCzoxQbhpipVuBGnk0n6B/Q2SCAGOymYPlAAk0F/UUckf+lgMDJwVyAFQv2RlJ8mpfkMK/4DOcQjdKhWrRrp/VG4t9HeDS1VDeE5U7RNXc86gocWbjkmGuiqOR9wwVM/v2OX3fTGidQZzLWluxFI76RoqWtVp0mDG4LqRbuwR8h8K5sHMrkR5hhPWU1TSIuPvldmj7YDKNYJPZXAHlUXd8Op9AVX3masOJBiaL5DOkRN7FrA28EEFu8w==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>