<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBeforeEdit "
if @@view = 0 begin
  if @@admin &lt;&gt; 1 begin
		declare @$checkUnit varchar(32)
    select @$checkUnit = ma_dvcs from @@table where ma_dot = @ma_dot
    if @@action = 'Edit' begin      
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkUnit and r_edit = 1) begin
        select isnull(@message, '') as script, '$NotAuthorized' as message
        return
      end
    end
  end
end">
]>

<dir table="vhrrmlichct" code="ma_dot, stt_rec0" order="ma_dot, stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lịch kiểm tra, phỏng vấn cho ứng viên" e="Test and Interview Scheduling by Applicant"></title>
  <fields>
    <field name="ma_dot" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Đợt tuyển dụng" e="Period"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="1=1" check="1=1" information="ma_dot$hrrmdot.ten_dot%l"/>
    </field>
    <field name="ten_dot%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vong" dataFormatString="@upperCaseFormat">
      <header v="Vòng tuyển dụng" e="Round"></header>
      <items style="AutoComplete" controller="hrRMRoundExamination" reference="ten_vong%l" key="1=1" check="1=1" information="ma_vong$hrdmvongtd.ten_vong%l"/>
    </field>
    <field name="ten_vong%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" dataFormatString="@upperCaseFormat">
      <header v="Vị trí tuyển dụng" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="1=1" check="1=1" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
    </field>
    <field name="ten_vtr%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_pv" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày phỏng vấn" e="Date of Interview"></header>
    </field>

    <field name="duv" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="307" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrRMTestInterviewScheduleApplicantDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_dot, ma_dot" e="String: ma_dot, ma_dot"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: stt_rec0, stt_rec0lich" e="String: stt_rec0, stt_rec0lich"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_vtr, ma_vtr" e="String: ma_vtr, ma_vtr"></text>
        </item>
      </items>
    </field>
    <field name="ma_dvcs" disabled="true" hidden="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" inactivate="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="367" anchor="4" split="7">
      <item value="100, 40, 60, 100, 137, 100, 8, 58, 50, 100, 0"/>
      <item value="1101000101-: [ma_dot].Label, [ma_dot], [ten_dot%l], [ngay_pv].Label, [ngay_pv]"/>
      <item value="1101000---1: [ma_vong].Label, [ma_vong], [ten_vong%l], [ma_dvcs]"/>
      <item value="1101000---1: [ma_vtr].Label, [ma_vtr], [ten_vtr%l], [stt_rec0]"/>

      <item value="1: [duv]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOy0odml/sEsB5FJsGK69GPVde35vGZTgVSXtYEcOs7Lc3EY9oINjjETnEz6XCH6sPDOGSBREb+GsnWJJtm/17/A==</encrypted>]]>&CommandWhenBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1wCG08Iofxvb34CPN0r8iwZKSxlZk7NXGNYK6fUWUVvpA8lqYfh+SLVYcK7EbY7fbfzDZQ1otCDvo0BuQqCrCBrNbRjS+lXvHEJc+213IqR</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZqLQHvIqLTJUpo+DWhlymlb0f7glYOme62xjmIlCmOsw==</encrypted>]]>&CommandWhenBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyYk5JXxF15mosCXuRcLNTZWz3BSIGrHfpooAyOOscJC18HpVcHduMSMRX7IyeZfdP8RI7XUew4oy11fQxYWv4I=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Jp4J5F3IzG7Um2aGcvXIsvnOwItsaVovU4hQFqb8MXWBnToa9sFGGtqU4XSmh8kd1fYHIioXeCAh+6qLIZyE+AIMzYeQFAayhskEr2atgRRkxB1V5W6a9FM+56li1TsgRedln3HTH+KdDn7C/zFb/G//8Z9LD2FK74jE6BvjdOuv+YUm13d0l4eZ/sUxvkinA/FsoWz9KHC6/arU96D385wlDWqYm+mkSS46rPUO6BxN0SOqYOZfYeA+6TU8wQZwL2ilUCfOJY2+Ncnbzm+v1JwDbWu2fLXp19ylpEVN+p</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HxsMzlj4/+fNkHBNyveLQ8=</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70G3EOIb7g8D2QSNTi+oJEn46xokylbOKSHavDxBsPxMJ2FhCc5oYRUT8c48YsYncGiZcZ9s4K/jBJKw5mlelvaPjSFLL+W73V9RVUBio4XMXyeuRxjj2WBAqpomyNK9ltd9P9YU7xj2UzCRxObwHNBMorBDRC2JJjcgw/DWSKQhnyXbptBykimpiwVvjmy7IltLpeelNiIwz5l5LmlzBx/49Lxz+XW1URt75ZFX9z0uWUGe/aJ5gGZPnDr41SJYyrAtwuNoOD+HwFFgQxZJof2A=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%ElvrQPlzTk0ftQh7HqPoRP+FDt6KD7t5L4bOqU0U8/Go0gYh8Zae0eY8HaYhIuN21D/iDisWpoYe1EtlKeqN195Wo96ytPRL6+2Qo8gSDjdgcBZQ5RrPCt7FFCYQF1mzOg57kgKHCJXu4mXBS6ugYtcWqJm+z6uq+70OtluQrxCa/eXNsQ7oMuADAOQ0fpYdU+oM6DADqRQOZxPSosEfCFcpINDt9/UiZ2rUeWFxOvFCbQrMsDcT+Rslfw88LqESWsbLYnecDkhmHw20PluplDVWNHPo6w2ivsPyVgyQu2ctiHsyY/Bh3kvwVDuVVY9y71hD9GQRZmQHwZaj67kG4bIvJxnMmpMcD8/xY/fScAmp+wKpWkPml0pm5TPp2hljQMigCQxGRlF03KULgfWvSFa9OgkGA0SxM7EmVCjjQU3xsRMPUw+bLpNr8RJehCJDKqHi1LfvLGRQyPPVECjLeHicSdZdTRM5q9ew7ls8JCW94UDzM1sPlLg1F/XYgOIbSjZR8VY1wb576rkQGDWslll+XJtp0gdn+Y775y9McszsiLtmCsAgVD9mGH3YWEUHjkZMVaQzWwu4edIWoievXw==</encrypted>]]>
    </text>
  </script>
</dir>