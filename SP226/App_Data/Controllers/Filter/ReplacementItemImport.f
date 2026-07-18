<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "ReplacementItemImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="xdmvt2" code="nam, ky, ma_dvcs, ma_vt, ma_vt0" order="nam, ky, ma_dvcs, ma_vt, ma_vt0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;

    <field name="ky" type="Decimal" dataFormatString="#0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0, 0, 0"/>
      <item value="1100010111: [upload].Label, [upload], [upload].Description, [ky], [nam], [ticket]"/>
    </view>
  </views>

  <commands>
    &UploadCommand;

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+Q+DFCAfaOCNukXyqVH7r2LzAuS4h5pM/64FNRT4Y+e4ZlApqQajNuchB6P7fGPHYYk0UL7QIm1eUU0NYrxALL</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1lNA4DjgBX0LW9i+jVIioSKb+ItrS3ByshTWlC+roCUvZvnqzKrFiGUZOXGPda63j3cvHJDJNPpdsK9bamTBCcO5vuYhtTIEzEdGbsBzvMzeNyY8vMnrdqrmW6lKj93Pm7TIWAre9vAdnP8YlSa/Q8WTID5M4ctjUy0LpUKqlOBNDEXFjX4vt9td8Mhb2IMRa1onUTvwdle8Sucvqe+OfgGYKKXzq2uPKzyM/FnFizmx8ecSIUG/pvo6FCm7k7FLjQ9vnMatvJnCqrdr+H3rnf8jSOTsztgdMdkBFiryn7WnhQymoVN8BQL1dKHZ9z4YXo2jJO5y0Eq6p6jIiy7GXn2hI7ZAjUPXrk7G5OaEFliWudFgj+aRniF8rHMSonBHe8GeFTKMDXl1uTcMW7eTj89DD4tvEkfmYHk3qLS3NkjTfR3oajbJKZsrybgHSL+s1MFeF11+KVwLfuE7fmX6p4i0WamupKgj2xJMy3Q83PAJokyIiICJ7sg/Qa2dyCSLLG7XrdwKZU63iMmt9dwrFJY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv6NpeJBtgNspQU8VbvtnNC4XFuR/Q93QEYFTl4nr5Bq4Im0hxjS3U9ifdHFdegbJrM6qkkgGgAHPW6VmEfJM8i0hmxF4hgKc/Q8BpU05Zyl4tksjW3TwVIMiT19b0tiq6m</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uazyxs2A0Q4JFMJfWe6LWDpd6r2KjoOWo51uoO1qkFe8PR</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>