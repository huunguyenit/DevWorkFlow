<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="hrca$000000" code="stt_rec_nv" order="stt_rec_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="thang" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99JaHbgj9Egy1cLU1R1asVbEjfGIt90YXz+/6KzodqAhz968W9aNveT+WoCBsHYrEOVDRoL2jkYfdNpfsEalez1U=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="bp_ref like case when '{$%c[bp_ref]}' &lt;&gt; '' then '{$%c[bp_ref]}%' else '''' end and status = '1'" check="bp_ref like case when '{$%c[bp_ref]}' &lt;&gt; '' then '{$%c[bp_ref]}%' else '''' end"/>
    </field>
    <field name="ten_nv" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1" information="ma_vtr$hrvt.ten_vtr%l"/>
    </field>
    <field name="ten_vtr%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bac_ql%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11: [thang].Label, [thang]"/>
      <item value="11--1: [nam].Label, [nam], [bp_ref]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_nv].Label, [ma_nv], [ten_nv]"/>
      <item value="11010: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="11010: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuw5p1HmaMxe7L6iRTWh9XJAuqNYQoeBJerpIU8TsjnHSMdVibw9T9uq2JwIw295zST/fwQC7ziZDJBHpKoPv1rFJ+eRMnZhA8lq+LaXWhndx+BxfPLvr8tMpT+E769lgIQ3XtQogp4Wmrk0mnXbtY7VHcK/23p46/J0qX/dkyKsyVARLeFuL6FScuJACP8o2i/wtD/2l15VzTJLKGW+c2M4=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMt1oHfmSZ/Mwp4FHr/BqIyeMPVL+adAOWwEXWIqKK+3fhodm0VPUHmz73mNW8Nf/4liXe++zNLORIhYQhvoCi7ynWalUNJuPUj2t6klzCa2</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4q4wHRxEMjdryPRwYhSvsNKLmKHJw9LXS/1u3+p6Cxkr6V0zX89ME7xoc2T0tESD/7iDiqqx97kOfN95jzrSi2f/RnHVNY64OVm+jesasXFuFmhdi5mlvlpXq+I/0mwDVeVSeM8BuzNqM61SGTbSGBrE1HfuV3m3GB0/DM5jSDxvAdNfabMcVQabgSX9jHBw8Hzj1x7UdUEMReAS1vEJEsJA9zRjjgWo/TyRAPyPkXz0lxloAnC4NP0FT/XTLVLNbeBgSLpuhK6/e00CIhT50Xv6i4NZbTHrPdA8+K0YteNIl2tw6n7AjffN7T2C6FUUug/qpFYliD2UvoFvtwD32qecuaC/rl1w3WlGr3MtYntLG39HumUdTfzHKOhDp+DNF3JK01YW6STaNKLwn1E1ZYV135ivFh2eLZKm++XxRktK3+DwQg4kCRwGONPGk/fTDDROYmeGvtDzScocjs1PDrdd1uFqL6Z+54YKhaQFO1BqJ+M8qc0dHRnDF5D8k3EhZxZKYH9nBDh2LB79HRYvi46kN43ezed5LYIXF92LHeBBV7a9CfHgEllSji50WVxt1nYT9BmrSoDp3K4naP5IaRnk10mJPrf5H6+vj3tITq4+p4z/dAnZBPCgleP6xEd4Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VUnpjbT3E9t8Qf9CVrfAV/eVE11iNBakFoZmaNFBhnHPSOWKMlHHrNn6i7CsDbWHjrxJ1T6go/jqtyKI8cKxbf1Z3OOjdI4o0x+1Ew1rbgpkmQwvqSmS6tqBPzQRItP6rev/P14OtOQiHSOIaIC/BdMJdED4AAtCXoJS3gQomWdiVsuqx9T8UChLsdcNdeNvhEjJIowrpNHfkg1a9fciXO2HhmBw4NB2Ee9lCdmt1kf3K888Mub9/Zdqhnigz8rfNHZRUzyv74dysvm9zzxRgD4qvX30QgQRoB+Qx/u2uFWv/b7vzXEIX3azKtgbkR/A+Z7c2r0LNAk8zZTojAWHLBVLH/XuQWomckZzdwA2zM+ctQqUkELdXaJOU1VVVwxuG+tReS/TLoRYu+IRB5l/jm6BUet8HZVJH/JzguyaNjSbG0/QRZby29Su7dnd1zk4eTvwIyOE5mzkLkIVhffrvHvvMPN7NpYMKCZepPjPKXI</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZ4U1jXLSDdXIUZ789fJPaR5i4ryX9Tabvz7H08MBh4rYh/T0LcG7KMW+sglwGbHjkSd7eC/oaN9SNkLj9lAPLr8c6jsSEzoE2VgyymK9snznHZ22ds8SBB7WOXrx16SVC7l7TsL3U00SmfLtaMlWSVIvKtaeKzX6C+JOjOQXvrs+ELAZyNGxBuumH7wrTHx5CvbLQbZN/d8gEPyMIgqzgWvMimak9B1lPg8WqSUCOF6xYR3HsbziXTTxcj5ucNSxgKYG0w1qJByZ9ySbGGzy4fSyxjSy7xYMcQ4LFVAhtdYyP36SmnUwOgk1Irk3kX1Go83/q6SUioDYJwkK++8KSoVbIakg/Ga4VRF/7tmeIJ0qTavugRLYMaN3CFB6KRBbOpewmLuhuCaWuw98NwQkvK/pzNp5WaEyIwT/QTtBqDY3tqNN09lxkuahKdgEGsbGkb01D1kqimnGoj3EhI8eVC70y14BNg2GOoiYvgokxZWHM+CMIugngJas21ZwJU1CWVe8r/YwaofVwviRHUt3BWpEHEuIzCzLNNN86oQvN0AbooPl4SCgGP8pJiGoL/HvFm1lvz0RMtDbIlr+GWv91jN2SJCKSDkZL5lgwJWrEgVf+OCqcwwjImKFiFbXtxKeyay75u5jbrjs3iWVYIGdcHIznsw3WHKtC9A9qzWjQ1xFVnGLsj3Z0sNNa4PnPPFDAJ8qV1wPFw6UVljQQphWTDhdoLyaQku+860BTQ3qiIFzMCt6yBq322HrIWkIijdvCaFepPOmWtBRnIy4RiEZcm3AH12NY9dkrzQrawKE+NpvuedPcR+J5rsyujdCMURWSu34HytnJk2HiJIRblQ4Fwqc/7jHBQSz7vcfGXQa8U1/C/r9O8AJkof/WwuLtDFaY2VIc1tjYmGhfAk4QlMInYm86hLaa/OuRUMeXz7v/KgrSIXDsT5L6nSoGhTRpJgbPJLwOPXkd9HJH1Zd01MTb+QnrTCebfMyyqB6w8j1dYajgSndyG8gh95yDAUeFMFBjlQy8fSWYkYfaHynnWxIbE=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/oKUmX0302sbDhc8SCfv6qyS+57AZX9OCiqrO8xBUUDDla/S+iis315fb8H1wy3bNUsmpPt7PJrYyq6X4mptNXjcFyGHn7ULyyUhvtzCseRpt3CjnWiqfqOjLJwVgVxv5ZSG2cbrDxt6xVHUNtAF9o=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>