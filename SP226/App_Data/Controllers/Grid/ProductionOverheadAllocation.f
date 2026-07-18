<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CostingUnitLockedProcess.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bút toán phân bổ chi phí sản xuất chung" e="Production Overhead Allocation Transaction"></title>
  <subTitle v="Kỳ: %p, năm: %y..." e="Period: %p, Year: %y..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_yt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã yếu tố" e="Factor"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Item Code"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_no" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản nợ" e="Dr. Account"></header>
    </field>
    <field name="tk_co" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản có" e="Cr. Account"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_yt"/>
      <field name="ma_bp"/>
      <field name="ma_sp"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQMfAojPBgYjmedRvIIkUy11HPlI8kbwhrmi4YttNVTW2zpeSToSRHi6MPj/bW7Kq7qIhXDBCG7YXVvWZXbojM17rampVKf9cTDQU6//INlN6Lz3YwHvkGW2EB4+f/WRrtL0tKGPW0Gan65dqY3gQedGkwksm+1h4OJf1tfpU2KZ/PVGvYiO8zHlvxm/2uV7bE0mlPBOe8s12lRBVdzaw9dqIfJWr4JxTWTSNlF16nzN9Yu2LI05d+ej5tJSVrChkby5y/0EcozfbsHiLV4D34unc8I/M9Z1hDBwALpP02XqY0Ghxd1XUGOTErohae3lU9fzyGsQ74RlZGajwUmZV8fF8w16GhI7jqrGNE2BLBbDrhudXXx/jt5xtrJnmonT06oiASXMUfbKE9Y+FbiQ8XLp1/dphAIWv3rvE7Zhf3hR9gX4SvLae0ApfrawM61sZQDYqFKdSzysQlWdGMWpdfAQjZLVvaCuzMw9Est3+DjIn/z0KE1TEOiPEExmfe5cMjG0Ozy789wR72qXE9XkTZf3VL0pb1yDdwURINSLuI9APMUs5jWq33DzEHWxt/CkLX/qvFipLkgq2vzGqh+Snb2pjQXFKDaj/PKn1c01QqM5+L1Y7AudN92bRUFzZcnFIw9I8vOW7faQlXw/oYdwWEuWIy6ZS/DS163N/EPEUQw3cO6MKh8l0KKHjhSKoDmEw65nZIF9n4M4v0Lxgev4OWLjiLZ1rTLCI5yW27gqutpkx9fD1tw2SJSDQzhk8xUic4RdWlQgY39fHC1IeDQULF8LJc+7kmPl348yKyhe+xegEjYh/g5pyhLt6hVk/HJQ+WQn2aUUECQRHarnrDKAoHy9kkstY+b3VLPKXlu43aZxq+n8PRhEBmcGI2y6QlnP32wL+YOMr1rHmu4DX7u9BDfeQ==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1pnKuxt5W5Rczm3Obp+mpHbJ7/UvWdh3pv+YGekJH7hJgk4omSWd2TjsaNYk8uwZ4re0rcJ6GoZ9XzdUxBFCSXIgDcOYa2wQhVavaWofv7G50mH/ZLvkmYyeZSDnn5xCvrpN+DDaHA56q9lsmuvBQYscvinJb9WmaCBXbe8HN/pT43evsYh7G5PAhKryHqMswnDrN/axP7ZeZj03t50rQLUu8hCAAqJImFFZg02r6jcC7GYlFnlxyC540Vz9G5st5LdDasMrUvQ6vKvpctbWRs=</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Allocation">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+WzIv1LIniksQQUAPFwtU5qjV9uUgGgAZ/Re0PyGQT8+GvG1ey79D4avQqTkIcswV3wz2jCEd5yR7wZFQXi0v5JGZyHb0su0dyQtAau4c9H4+ahYMb/xEjEKnij8d2z3R2alLxCyGRDtICumb/sL2aLDOnEHkUTOJbVXW0mjShz4RVSBG59fNWCYuIUO0EWsH5vL/go6WxxmF680ScCvVFaWspJxnWo/q4Hq5X5/ZYjAwcyAQ3m8kJfYp9C4N1TPvfVHa3xvPCngyQniINNwaTvYSB1XB7rhUJ2a/cxTGldxg/lGMKFqVVTn6VX20wxwNScx+cx2tTjPSu2bWqUUHDUgMSJm7CDnRQgWx8rqlKNwgyRxpLn8ilTeQU7QpsWtrfVORgCYtB0vjhnnr6aFHXa4bZZ+0vFBk5JnzXVif08oG/LDiQShHyYRSjcLsdhei0moU/htbH5gl21ufhfcBI4d4+aa7/uY1N+KHA8CAOiN5huzU1naOPFdIXxxpDb5Orbc1q/YJbW7QMpNf0i+5Fx9K3TMjzwEDHJiR6HUYnI5FEK+FYuuK6FodQHYlbv9w==</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="CreateAllocation">
      <title v="Tạo phân bổ$$90" e="Allocate$$90"></title>
    </button>
    <button command="DeleteAllocation">
      <title v="Xóa phân bổ$$90" e="Delete Allocation$$90"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>