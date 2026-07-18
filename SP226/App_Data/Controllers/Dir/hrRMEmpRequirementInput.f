<?xml version="1.0" encoding="utf-8"?>

<dir table="hrrmslnv" code="ma_bp, ma_vtr, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="yêu cầu số lượng nhân viên" e="Employee Requirement"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" isPrimaryKey="true" allowNulls="false">
      <header v="Vị trí công việc" e="Job Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="### ##0">
      <header v="Số lượng nhân viên" e="No. of Employees"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="stt_ref" readOnly="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt_vtr" type="Decimal" dataFormatString="#####" readOnly="false" external="true" defaultValue="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130"/>
      <item value="11100: [ma_bp].Label, [ma_bp], [ten_bp%l], [stt_ref]"/>
      <item value="11100: [ma_vtr].Label, [ma_vtr], [ten_vtr%l], [stt_vtr]"/>
      <item value="11: [so_luong].Label, [so_luong]"/>
      <item value="11: [ngay_hl].Label, [ngay_hl]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIfzMW4BIo4CWhuKlHVVBV2s9pQivRR/DJT80PN8neVhspwOoq0ja6969OmFj3KyGV23H1DxSWkIRlRAWj+PRuOHOAJ76LeZpOW4BjKItluNVw8fSWLU+aN0xSpufPQIGZFBsMRGBgB74mBfQxuDQSieXPeFCEhs5RBHJ0eT2ZQ6qE3nahbS+TeMhTwmmNIi4qgH3sw+K5ADjFQkiZYbqZ4dLzPe3AcMsqyHzwI/X3ciWWkwYNGB7mUJAqjXoLdANRh9nCxVUU29qDKw9jgEi5My0WrmLIU/KZp7AuMSFeA/9xtFt1L1/rPaDw9umL4VB4/UWZl72Z6vEMG1M78ymgrDjpXS1NB0BO13PZy7YbGTKlc+FNh4pGeVFvUBBmMuM04mOAFxUvLhg83sO82xSjDczq5hP2lnLk5YuelpZeOkdswmheQU/8J7IFFcIzSAfOBACo0r//+a9QermYbCb3qJOZbcAENytc/+/9j3NIcSnLEpaXbm+3ZlV9Wrb7Y+ZW4dXKsFkSLL52KY/QiUADgQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUWqLFFxGGpudDEGPeV084lVqhguvdW1UrZk6TxXxE/nmQklhS8wjHkQus2hO1lgEx7gOhb0ajgCf5ofMK/1CBL0AOJAJo2ZFUA1FZ3ej1Hr0rBvRvxD401eHRb6W4QuUdrOo5gAAPfP1BqqjwceZ8bAvoMgHLwSijzbOqBV2H+J8Y9F7I9G4c8d5ECq6IkUgsfcNyK1f6bRtG9oJ+zQnOpNw+0ujQ1lKaih4YjqBLw5K1V+c3vca9fz4/vaT3qmqMeMre1WxN60d9DytlAbVUoQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLYckH7FnokB58Km/cpKVFuydyqRWxo3adprEs7ikTHDL0egJKfcXd/bOQIIIh3yIbPqGWDq5YAZQ8KCZ7vIAHZzbRC2vf5L8m9su4ueKJRZZnFCeJLKwelLaELvIKqdhMNjL6ZJvA0sBlj2QO41HMMtEpa6iwn2L+4JzAT5IHw1l/WR9UgIFZMMA2z0pMDRLSDVZni4daJ1VxY7VNbF7EjXSeXf/pB6VlAg9x5kpWdaB8SJV8QHeWFnhQMlrBHMifP7+pS17sbV1bx+QJm08wZ0v30WUWp1z+rSnKD29ApP7zGzwePOUyu3c6rXRPJqogC4zQ2qNtJFszzleYgPzna3QjciqMHtbSB115JeXA7UcbwvTTOuwKAR4+m8gVtvXCnCEM0L9UTSJrdxnNLS+T3w==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV2p8vc0lzET3U//BRXudzUcx+XMRiHR7meLhIt2MGQKyMT+T3zIS+DwNvL7irWbOelybZaTs0x1WyAZZIlXELBc=</Encrypted>]]>
      </text>
    </command>
  </commands>
</dir>