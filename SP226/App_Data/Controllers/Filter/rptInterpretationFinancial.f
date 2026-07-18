<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY TransferID "rptInterpretationFinancial">
  <!ENTITY FileName "case when @@language = 'V' then 'rptInterpretationFinancial_01BC' else 'rptInterpretationFinancial_01FC' end + case @chon_tt when '3' then '_A06133' when '2' then '_A03200' else '' end + case @mau_bc when '20' then '_02' when '30' then '_03' else '' end">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A06133\ReportCircularTypeField.xml">

  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128)
select @ticket = lower(replace(newid(),'-','')), @filename = &FileName; + '.xlsx'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, case when @@language = 'v' then N'Thuyết minh tài chính' else N'Interpretation of Financial' end, '@@appDatabaseName', getdate());">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY defaultTable "V30GLTCTM">
  <!ENTITY defaultForm "V30GLTCTM">
]>

<dir id="3" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky_nay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Kỳ này từ ngày" e="This Period Date from"></header>
      <footer v="Kỳ này từ/đến ngày" e="This Period from/to"></footer>
    </field>
    <field name="ky_nay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Kỳ này đến ngày" e="This Period Date to"></header>
    </field>
    <field name="ky_truoc_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Kỳ trước từ ngày" e="Prev. Period Date from"></header>
      <footer v="Kỳ trước từ/đến ngày" e="Prev. Period from/to"></footer>
    </field>
    <field name="ky_truoc_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Kỳ trước đến ngày" e="Prev. Period Date to"></header>
    </field>
    <field name="type" clientDefault="10">
      <header v="Hiển thị" e="Display"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Chỉ tiêu đơn" e="Normal"/>
        </item>
        <item value="20">
          <text v="Chỉ tiêu dựng cột" e="Crosstab"/>
        </item>
        <item value="30">
          <text v="Chỉ tiêu tăng giảm" e="Balance"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"/>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn - năm" e="Standard Form - Year"/>
        </item>
        <item value="20">
          <text v="Mẫu chuẩn - giữa niên độ" e="Standard Form - Mid-Year"/>
        </item>
        <item value="30">
          <text v="Mẫu chuẩn - bán niên" e="Standard Form - Half-Year"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="11001--: [ky_nay_tu].Description, [ky_nay_tu], [ky_nay_den]"/>
      <item value="11001--: [ky_truoc_tu].Description, [ky_truoc_tu], [ky_truoc_den]"/>
      <item value="110000-: [type].Label, [type]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cGdegLypqmJGFbjqIbmcX1IYjsgb+Gte8TQj412JLiDGAp0Nb5anBsvUTqgWJD7aS+5ksvyziC325Dwiu+CfHXlwt6rBQjGjyG1Z/RvSUUzLl2kvNMpslLlXddb0Z3Q6CnB5Ue0SspwyO3CnluSme9RJckzOm67CckPhxeX3PBBtPyWSC1TnvfYKwZb8gC2Knt</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBtYb2AJBCBWuxiBr/ztuzptg3ysyH29AFd0gGER19UPcM2VV0YFkJQZUeaYQ+lT2SHZ2BIwYtmMpP0xLuvlyLKx06QTaKEXpPuAcjW5JwSVt2Eqhme4az/qKQSRKtSp5eNMzrMTsG1Gbx6cfyA1Lj087yKurTo5T08Vagnvhm+sJfIvu9cE5/NxBfACj9p6Ln</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&KgiT2k4AdcxFxW1gK2q66hY2Q8s18wMZY/spWLapXuNMp84vLgEey6QGSEB+UzDHo+Kgc2UJrqDWMGkf4DPTKQQ1hpImQmxbUDCW1abYndQ4mQ+RASDIwY4lZRJ27t6E/PxQ76AWsaR8jDc1X8pKym2Y+8WO3/wYMhTmkBZxI+kVmwr4T0cl7bB/2zWvx8x+aA49L995RzG3bY0nNy5208R18HjvZ/OGLT8ektOuXvzynd1bdX5JcNuVuVuti7AC2hkRafgay3uvulrVtl8Kf6dDkjDs+yJG4i7539bIC4arEXDJmoqxAgFDGYWJUv9b</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHQHZ1sEfLBLAU7ylm0Tw/KMAwDvGz8PZuqZn26s16Y379TkGqQ6m0u5Cg6UVwrK/Pg1/j0At7S025XUSyZZJvk09qh8HqJYUoOjuReipBcoik1UZN59DX7gYls/47HU2Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VyI/voT65Uj9ceuBFLF5X7qjxYiIWD5VMaGbusDCF35o3rHeOlgZ7hIKL1nXaT3zqh4nNqlERZre4UQxtx45quEUwN+KbXc0nN+9XK5JCRyxcU+JQlhiqQNMO8k7fTrSy8n+2MhVShLzOwS+CT/xCnM4E/qTyyYIW2FFBNnzDlZ</Encrypted>]]>&FileName;<![CDATA[<Encrypted>&4ZPjJCDV5/vla5iUvMOC6y/QGS/TL1Hnzb+wektVlgY07I0oV7J4nBOKCfg5f6my</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAges8o4N03bR8+GwFVqH1UufTuMEQNRJ1iTmzWlTKSefqVNLCpJUcYZexoghw/lh7eYfyhy0Nshyif8RpD16aZp66H5BLkHcFtPHoBhB2XWhjkEnHkv+t99YwPQ0VZlIuKwJzvVknA454u9gmo8BuLmGevX8swEPH6SvKSb8QnOy0kSPEu9AOAow7gxgsXTmnUFo3ijss+0cCgEj/2nhiOU6CR3ed+xSvhhlei0pgC+hONkYGKUBLf8xz4gWr+i305I8xlwWcLnuNfRYtkCrzu7UL+rcaXQjuR3CKVFwp/7K8Gq17EyctO14tv9+byqBdjEcgvmuETzoWqYIsTHXm+wFBdCzel/FYbSM6fjUuTePiOy3yj6hC8Eh87Mozemy9g9QQrUDUACl+4F8XTKR6rmOzUrT4vOTWQ2PklUWjz0jPgj+lPFLynjSICxZ7ij8rgBwew/X1dhcQD9D/Qqyld8eLDjfnqWW99urlVEHglV4+WDZvP/VIdvlYvYts+ORnjYFFK3nP19KntTOJ1LmIsRbsF4oivMzrSWQFRgrw5I5runFAmo67QU/WzqCazEeofYD4arV5Dp6ZcjvUSY0KzApKkn6VbJyUWMScFKhiUXwT8rXgHFhBpqcVfl6Tu+YoakGRjEKfTFLRZwMaUgBGEpZZ+nKube8ppO17R7D6LLLzptxt7EzEK7Jy+2kEjklnX9vTOUysu+Nq6imE0LCThyLYfyInQ32eyl/DE/8uaS6OH8DA0NVA4bY35ZDAfaJ1P+mDnWf/s5+RCnYk8b6H7OKw8eiv5psLjdF8Zw6Lxp3J8RmpGSNuHQ7rY7ZZBn6nv8QGEXyTrAouFbhLFhMORQqGpVBNzNtInZ/so3gp4twRb2FGj70AwGEQghI6zRc1U/h+Oqq4cHJwPVbPLrb199mPF5hv/s9sIPq+PNTJeR4eCux/jMhpDqZlheEwneVZFt3I2B9csH8gZ60UlPCxIYkD5idzc3JumKIflHzbnLqeEID+2DMkFyWqFSHswXw3+ashTJgNL1SR+DHVyI5bI81fWiq4DSbIp+WUfJ+16MR1jXAB/TAbuT+OgqGPEJSedphaiRNZT6YE9OGbuDCgcY=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>