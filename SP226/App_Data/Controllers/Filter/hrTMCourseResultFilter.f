<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "hrTMCourseResult">
]>

<dir table="hrdtkh" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Thông tin khóa học" e="Training Course Information"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_khoa" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Khóa học" e="Course Code"></header>
      <items style="AutoComplete" controller="hrTMCourseInformation" reference="ten_khoa%l" key="(ma_khoa = '{$%c[t_khoa]}' and status = '3') or (status = '2')" check="(ma_khoa = '{$%c[t_khoa]}' and status = '3') or (status = '2')" information="ma_khoa$hrdtkh.ten_khoa%l"/>
    </field>
    <field name="ten_khoa%l" external="true" defaultValue="''" readOnly="true">
      <header v="Tên khóa học" e="Course Name"></header>
    </field>
    <field name="ma_mh">
      <header v="Môn học" e="Subject"></header>
      <items style="AutoComplete" controller="hrTMSubjectList" reference="ten_mh%l" key="status='1'" check="1=1" information="ma_mh$hrdmmh.ten_mh%l"/>
    </field>
    <field name="ten_mh%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" disabled="true">
      <header v="Ngày lập" e="Create Date"></header>
    </field>
    <field name="d09" external="true" clientDefault="0" defaultValue="0" rows="208" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="268" anchor="6" split="10">
      <item value="100, 100, 100, 137, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="11100010-11-: [ma_khoa].Label, [ma_khoa], [ten_khoa%l], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="111000000000: [ma_mh].Label, [ma_mh], [ten_mh%l]"/>
      <item value="100000000000: [d09]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>

    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9DOEyMeiWHuJwicJzHzOxdEtwTd9f16/iaXmq12f8AQfPT8oPc1iul7b2HQYM9bayA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87mjIsN+mx0iHvUzg29QGG30Z3V3CtdwZiCC+vVGJ0o+dWeKgQLw1vcN8OxRpzg5DwNHsdXFdFDX4xB5fIsbj67Wln8lvyVTiqEvxGH3H2qazg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9FHxTIUEvJi6MTJ4CXEDv1EAW/r9s1PmviY+dsmpr7azOtg6K3CtwwJkpi3V0ukSo2Ob44HrNlde6enxWEOVHu87t/qF8XOvbAMmA/8HvUspgTKV/3uoiA+H2TB4vtPcqSim/tF5OGMga71MTIXIH/hIaKE/qhb1jFtCTvcnnf48lIeGoxLsxrqoMzgFC3nZbsQG8B/gISF/piRhZ6E5r8s1akBrePSzzVijR+RlVDnRpbolAONZouvLRs+ZrkYbEZ6Ae4351VxmXniMiMR/634=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ngw/e5mUNSQfG0rHhVKw8Cz2hkv0KX2Ig6TmnaiSV1oe6QKjOPtCM85p9Fh6qDglts0Koc+GtrpTjw8o1F5qtc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87mZZTZWmSpVnN2Tw9fy5b7Z5uK5afU8dEPfrZV0SkMnFIp2KxwEvb7M1n8aWNDnWlM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9EtyXG5Dz50BGy1srKRyoFYm5/ztPQciV7O9Mw2JUqeBbtueTL4Xgdpx7Ijp1mG8t9nwylckKF5JrjigCruUzOm+TcvDFDAIYhvvTC8BTtbpfB+rucbtaQcyop7L3rQB2G2hb0rpOvVoemeqxj0m58B0/5TRJDkhqV5YnP5q407Q</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9F1mxH/NDeiIx5Eb35/mdOJDv6afb/fnAWGAW4SEOCMwSOiEgihllAxeyeapfNvZwXL0Qj0YcoeiNcd58k01wo44SHAetI5tLOSoZyhD0w6N</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9E1xAwqunF1QxhTKuknjKkvEOhbrnzwwEkdScw5cZzFP/v6GyBKazTd0g6IAvnPEqw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ks+cMykz6XumP0keQrCD4hqaN6hlVQP6WtIuLML2Y58NBA2XwwbSyr0+GHbJwCq3GPaS6xDk8l/A57+QWZJCVc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QUTOjmFeYXiG3vYCsJh8Mi/0RYGIG6/x7uq1+i9OeIOmlnwGxTf/2Ivtfj52kxghW+eQ2eEZxPQ050/1oFLkHw1WeMl4yhc92sI/2u0E4ZZZnhDgTJGZuKrcMc/qLEVnpASHrAvweH44cA8vAOXz9khfmQIn47Y6QI2dKDeTVDh7BrqSXN3D8HNAdBQekzoEgvVXb84eajd0Fds0jmCxzIaM4JEVSb4DG7zZSOv1Iptk7L78IMCGBclwgZWviih0Cto7qhoGJ4piHJsp79zyUX1SrhU+f+8gTNCd3JxeQL8CJ1YTwsCr8F/ezxQUvtaIPJbERnYHpsy1/L5LAlWZsNP</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9BHzU8TljyugYIVF9/EjfO3OzSmGaYACxbqtN2YCq+csyVHiLNI+H/wfDuW4s5nerRpcKRNHS9uwkXvfEgsLAQevHY/QQLPPtpvelRDCrPKS5IvrxfCRuIFOzCBUn2Hs6+EZEYHke3zGKw1ykAUZFP6zK5evOKQoTAitspVuSiifocJkSXHxyUmcPRvsWSox++N8fRHxbkhQ4vqI4ZSMdS+e0bgiKz7zriLq8NrpZROef96lwEvsV5b6wYxFnUknA9Kir0zVpWqR9zA0cs3wV2mWG0cCBZ3eW2OI8nrFhl8nw+29zWOroqJA7kIRrMgfjSK1jnf7wnJa8yX86l+0QGMv4HAvxl7zGfPIDZv35QJeLEdP3BZJBVuPA7pGtXa6oME4iNpZ20fgF84CJd++MKvjFAEliM0ZYflAzfuLJXmP</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9LCi/z3oq75KsNs7LWYCKy+w29Gf9yiqF7OwJJ+J+3O2j+dd2HEPbWPh7mVMN3Ebb/OGM8+8C0uUpTuPcotejCJANxU5HoQXaodwKodjHv0Umiw7sqxqm/Z0tqXUWgrQfegIFSq5dPvH/Pfd1YF8V1IQMNBrgl/KKaUBRwzaoX8h</encrypted>]]>
    </text>
  </script>
</dir>