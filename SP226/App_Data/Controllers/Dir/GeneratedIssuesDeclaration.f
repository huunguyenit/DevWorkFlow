<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Check "if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end
select @message as message
return">
  <!ENTITY SiteKey " and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))">
  <!ENTITY k1 "ma_dvcs = @ma_dvcs and tk_vt = @tk_vt and ma_bp = @ma_bp">
  <!ENTITY k2 "ma_dvcs = $ma_dvcs.OldValue and tk_vt = $tk_vt.OldValue and ma_bp = $ma_bp.OldValue">
  <!ENTITY k3 "@ma_dvcs = $ma_dvcs.OldValue and @tk_vt = $tk_vt.OldValue and @ma_bp = $ma_bp.OldValue">
]>

<dir table="dmxknvltd" code="ma_dvcs, ma_bp, tk_vt" order="ma_dvcs, ma_bp, tk_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin xuất kho tự động" e="Auto Generated Issues Information Declaration"></title>
  <fields>
    <field name="ma_dvcs" allowNulls="false" isPrimaryKey="true" clientDefault="Default" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" row="1" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp" isPrimaryKey="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="status = '1' and truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_vt" isPrimaryKey="true">
      <header v="Tài khoản vật tư" e="Inventory Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1' and loai_tk = '1'" check="1 = 1 and loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_cp" allowNulls="false">
      <header v="Tài khoản chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cp%l" key="status = '1' and loai_tk = '1'" check="1 = 1 and loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" allowNulls ="false">
      <header v="Mã kho xuất" e="Source Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'&SiteKey;" check="ma_dvcs = @@unit&SiteKey;" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYrBN+8y/coU/Wwpt8Gu7F0v68+51hJsNwFrfSMtO1AkK/5zj8OKGVPasKS81WALUg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_vi_tri" filterSource="Optional">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" filterSource="Optional">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="status = '1'" check="1=1" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx" allowNulls="false">
      <header v="Mã nhập xuất" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l" row="1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ma_phi">
      <header v="Mã phí" e="Expense"></header>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1=1" information="ma_phi$dmphi.ten_phi%l" new="Default"/>
    </field>
    <field name="ten_phi%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true"  filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>

  </fields>

  <views>
    <view id="Dir">

      <item value="120, 100, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="111: [tk_cp].Label, [tk_cp], [ten_tk_cp%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="111: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="111: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="111: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="111: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="110: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7t06LeFFPkx0v2pgOE59vqlMHqTIA+GWHnpiKPehH7VUxxmyM77SrJp5aIqv2vcgcmELynMNq3wr3AsqEfTK7Q=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427Rdou7rbij1W55cpzU2s4UlFXzHSBYbk4laDHPQjprcPQF2fTth6QC9ICNGXfDAqzmu/EWSMyG4Vpr096pqvJUQFNExKQJFbbbGN2n47s6QyqzOfsmXtiNLdOj6lDNLKzO+oXsxqZeaq27wErAHfbmdd9Jz3Py/+hJX5k2Cu/FLEv1OWvW3qGVnM7w/MGIj9JwW7qLj1eycvS+zhlol7jMdBfvOfJ/+pWlNhe2Df3bHS0sk5Fqw3g+MmgljpdQ0g8NHgF</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOgzUofwBKJKNsSNPvcducwJKxmL4Mbm2P3KP8dCR/pt9BF/EWByLTYk156Q1PYA1f</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf17SB624yUQlLPN9Ubj+9HxP0fz4MjycPzxMWD43kFv1iXLAaQom9yfKaiLJNYQT2ffWnLPBn6soodgzhQ7SNeU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulikA8iMgv+3GbRrLR/gtJDK9vV136FT4HDnQ/BhzvtFlMpJi7Vm6xH/Pxac5wTlJFtve1rrUKK7oAZeleiwoO+0MfHUdDG2bhVrulai38ooacpQfsqXFPI73PNebgYa815NApAnA8aIV3CX68rt0j8DEOTMlZ0NUmaNa3KEGBVU+xMhNQ4yhvnMwc7YVUc7Zfxahznp0ArqcfJ3wWCzKRNZzq8L1EE9p/5MnDpRwgUbZVSWJDCJgLxdipUFhdB6cJ6jWI1EiOt9nzCIa703M2LQ7B0Pym/vVeBjMDkmUdlkPI7nImJDWEYv46wOf005pnvK7IarxLZi4U6i4GZDUfnDzyHn2w5tP3M+4zLSMupFzzWVCWHvxM/plmpzE0nxwiMFJalhaeEy+nUfu85jTsvtWf6uKcQen4dwxic1RyyISZhy9ydy6GpfBFpmz5xNrt6grr7UPyiz0Qh+s+1yxpTsD00zBopBDzZFfjFzom08Ux4x2cMR8WZ9dLNc9ZV5zlV3/eXd00L0l/y4X2F3Audew==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n5H1jxXkplu0G/tA5iz6tVQ==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmgqxHvvehoV382OExN0/CAFvD657M3pUVgltVE0jBiHTS7IrO042bMwtXsCSFsq++tx2ai6dnwUdUTF7H9/Q9wRlsInZ6cdhwczfGQcwzFHv3j21axQAvnZd1yHokEcauaZ5dOdc+0g1JRqE4XpeVe40radVLEW/vy4+SFynmsxiizmWZMD6EHd0uR9ZK+gLRzZwAzFASdOeK/rWJbPZ0j7</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHIfhvN/FgzGs7XWCpp4tNw==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmil7Uk79hqzsmWe65iO/nwAqcitq5IT81uSUmvTq9xfdGxMX0BJM3ORtuDExw09tFZSSTED9ti7rPTogHshkXVz+uIJ/OqKidQkiSR6iPMpBA==</encrypted>]]>&k3;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN6vlz3i6YtEIPeE8os6fQiyGz7pWrpfIa5ZGzSm3SgeRSG1E1VvrYe+n5rkOrfB9Io=</encrypted>]]>&k2;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYYjEvtx/DFlhOX28kEpDPoc=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYdX2bkvtVpvqS7eHmmxs9WL4iM0SkFAAJgUrh7CJ3Hzt9eOi+mqwhVp1tVDy7ri4Xdk2CsoN8/a+Urug4V4CyQyNfdWzn0fdmDS08dTAqDfU8eJkeZgm5x6kaAR3ePwlRNLJkPXMTKh0oMJmNT8DdcaaIDDo6gh0j85H338X1wVd</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VHNwvnNAfVlIkd7C4wD6ryrxwWrFONRsHEXPbrgx6bTP9KAKGpImDwazKEJlqJs0O1p/NvE+DoLvhJSvdGSxRGV7eRKKfqvgRrpVYyvh27738rAM5Gf4iZGTVoSjoyvvzpHkTSMLCQnQA52F7xShJw=</encrypted>]]>&k1;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwc0eRt6RUazN4oHG/ixf5n+hwkeN8s9DhjK2KY7D5ZWgz7sPGZm2YxhGfnrGlIeMV8RKjsFm1HHII59DaPcBeZZWAnuSCx2GHi0cCF22wAGMykR8Wr6lxKtyff4wHxG8BCHE+WqZsi9flCMVMW3LxXYjpSnlKZD28DNtdMzEE+0ZGLCia0gT4TBx95zMl0tgp+c8+0wpD07o3lB7E2xlWxEePl5q0e+xwUUBdyuMKKd</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k1;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FZ7Du3m7Rny2+OPmYoEles=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFF88DTU2hhFgDUM0bkA2rvTjL4wqIf5fbw/9vcm5CLoY9duPQL6KvSDo8b5vdamyEXCUz+bJYH1FkO0fVOHix7K9Sm4a74m9LCX+5ptz2gEDE=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BprlvBWW9xxq0CChMTPpLJ5UfaL+N3djXofkZNuSfpw8BGZnWRFDq8LdoTS5Gl09lo+s/VC1G8RqxSBBMB7rkBYVIODMwmO1NbFgtuksmBC3urKVjuYGE//bAqexAkCxbIP0pe44XcpUGVuVUdA+HfOc0rI51OHAmBGpSkkmsE9RnunlD26suJMRsbHMMdE/FCfly+fdWa1kWDsVh7wuoFlFdsfw32NbzRLyC2+qtmYouf/FGGNTXOCHPU+oLI1Kz3Sd8DmPlOwdSSoriz4okTPseFehmQUZCI12MfK/dVkbgy47AdqFTnW97OhRfJSGREfqNiXtezGfzpDRJeTqsSAImUIfxSKydFxJB1uQCFu9d8cC1Ce0brmnuZabzUaXD6RsBLEWJv1ipr18byBLmFFnEBUXCymTtdBbQfsupf6Z1GxJ693DMQNcUQApCLwS//JaziN4aA8ba5ozGs1lX9rAAZjfxT5u6T0ydOMFmDovTv8kVFSbfkOApKxuKZd8kIYSZrkGNkMFyX5A6MubyQHj303CVSWUucKOlE+i/xlc+1/GPD++C4i9jvMCS7RIJv9ye0zSxCZqTw/cDUcS/DoV3FHXolALhhDWIMqp2fchhZHrA0IAUVLamh/ZE8KceJY3oJl32yJXWBK8sILbzY4m9jb//bOdhb5AFssFt4SEJ6EElTt444vfLAtNvAtL1ot/ukEPAWd0s3IeVdrFdHERkbvElb/AMJlFa6j/WsxHqMRTck0aHqlZBeJFLlC43DeFGUGghwRn5Z76HZpKHtiXvqXwAF8wV6SDYXEglYGQpcpu4G3YUBou8MckPRdXFnE08+Tppy+4biJaWBSsgWpZhSKZ2rle3cFtmp9YOzllY/oTnxDBtt0TomxXjx1+xtGhTTf5MAMfED03Dzjd1IVKeFzhdbSzWjK50yGQ7d3yei/yO7KLJzJCXNGiXqvYdnZzAXlfZYAulJ5ptqaHHkioZ1kOu1vnnGxEX9Ve1yuYRVKbLBIpGxW1I7naJLIeMhbW7w98HH8yKle/woJXg0Zu4MCAUHKvHtswA2uDiP2yREncyeh2NnTIRVEVpTGHg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Site">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwiJFTp716WGUT+dOSl6JLyhU2V5kcjVLfYU47Q4Zfk3sImhBOotbX7TJiMbrAdYbmNJPHACWnlZCqwzchNJiub+b+gnU1ChJ2sm1+OjNtzUb9rSD/gZdrxka+SvfuG+HD9QTyE0+BwIAyFs57lG8Vw=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>