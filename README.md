# ApuntIA - Sistema RAG de Asistente de Estudio en Oracle APEX

[![Oracle APEX](https://img.shields.io/badge/Oracle%20APEX-23.2+-blue)](https://apex.oracle.com/)
[![PL/SQL](https://img.shields.io/badge/PL%2FSQL-19c+-orange)](https://www.oracle.com/database/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

## 📚 Descripción

**ApuntIA** es un sistema de Retrieval-Augmented Generation (RAG) desarrollado en Oracle APEX que permite a los estudiantes cargar documentos de estudio y realizar consultas inteligentes sobre el contenido. El sistema procesa automáticamente los documentos, los fragmenta en chunks optimizados y proporciona respuestas contextuales basadas en el material cargado.

### ✨ Características Principales

- 🤖 **Chat Inteligente**: Interfaz conversacional moderna que responde preguntas basándose en tus documentos
- 📄 **Procesamiento de Documentos**: Carga y fragmentación automática de documentos en chunks optimizados
- 🔍 **Búsqueda Semántica**: Algoritmo de búsqueda que combina coincidencias exactas con similitud semántica
- 💾 **Historial de Conversaciones**: Guarda y organiza todas las interacciones del usuario
- 📊 **Dashboard Interactivo**: Métricas en tiempo real sobre documentos procesados y conversaciones
- 🎨 **Interfaz Responsive**: Diseño adaptable para dispositivos móviles y desktop

## 🏗️ Arquitectura del Sistema

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Frontend      │    │   Backend        │    │   Database      │
│   (APEX Pages)  │────│   (PL/SQL)       │────│   (Oracle DB)   │
└─────────────────┘    └──────────────────┘    └─────────────────┘
        │                       │                       │
        ├── Chat Interface      ├── PKG_APUNTIA_RAG     ├── APUNTIA_DOCUMENTS
        ├── File Upload         ├── Document Processing ├── APUNTIA_CHUNKS
        ├── Dashboard           ├── Search Algorithm    ├── APUNTIA_CONVERSATIONS
        └── Document Manager    └── RAG Generation      └── APUNTIA_MESSAGES
```

## 🚀 Instalación

### Prerrequisitos

- Oracle Database 19c o superior
- Oracle APEX 21.2 o superior
- Permisos para crear tablas, paquetes y triggers
- Workspace configurado en APEX

### Pasos de Instalación

1. **Clonar el repositorio**
   ```bash
   git clone [https://github.com/tuusuario/apuntia-rag-system.git](https://github.com/DiegoLizarraga/ApuntIA.git)
   cd apuntia-rag-system
   ```

2. **Ejecutar scripts de base de datos**
   ```sql
   -- Conectar a SQL Workshop > SQL Commands
   @database/01_create_tables.sql
   @database/02_create_package.sql
   ```

3. **Importar aplicación APEX**
   - App Builder > Import
   - Seleccionar `apex/apuntia_app.sql`
   - Seguir el asistente de importación

4. **Configurar la aplicación**
   - Verificar la instalación ejecutando:
   ```sql
   SELECT table_name FROM user_tables WHERE table_name LIKE 'APUNTIA%';
   ```

## 📖 Uso

### 1. Cargar Documentos

1. Navegar a **Gestión de Documentos** (Página 2)
2. Usar el componente de carga de archivos
3. Esperar confirmación de procesamiento
4. Verificar el estado en la tabla de documentos

### 2. Hacer Consultas

1. Ir a **Chat ApuntIA** (Página 3)
2. Escribir preguntas sobre el contenido cargado
3. Recibir respuestas contextuales basadas en tus documentos

### 3. Monitorear Métricas

1. Acceder al **Dashboard** (Página 1)
2. Revisar estadísticas de:
   - Documentos totales y procesados
   - Fragmentos de texto generados
   - Conversaciones activas

## 🔧 Configuración Avanzada

### Ajustar Parámetros de Fragmentación

```sql
-- Modificar en PKG_APUNTIA_RAG.process_document
v_chunk_size NUMBER := 1000;  -- Tamaño del fragmento
v_overlap NUMBER := 100;      -- Solapamiento entre fragmentos
```

### Personalizar Algoritmo de Búsqueda

```sql
-- En search_relevant_chunks, ajustar scoring:
(
  REGEXP_COUNT(UPPER(c.chunk_text), UPPER(p_query)) * 10 +
  UTL_MATCH.JARO_WINKLER_SIMILARITY(...) +
  CASE WHEN d.user_id = p_user_id THEN 5 ELSE 0 END
) AS relevance_score
```

## 📁 Estructura del Proyecto

```
apuntia-rag-system/
├── README.md
├── database/
│   ├── 01_create_tables.sql
│   ├── 02_create_package.sql
│   └── 03_sample_data.sql
├── apex/
│   ├── apuntia_app.sql
│   ├── pages/
│   │   ├── page_001_dashboard.sql
│   │   ├── page_002_documents.sql
│   │   └── page_003_chat.sql
│   └── shared_components/
├── docs/
│   ├── installation_guide.pdf
│   ├── user_manual.pdf
│   └── technical_documentation.md
└── assets/
    ├── screenshots/
    └── architecture_diagrams/
```

## 🔍 Componentes Técnicos

### Base de Datos

| Tabla | Propósito |
|-------|-----------|
| `APUNTIA_DOCUMENTS` | Almacena metadatos y contenido de documentos |
| `APUNTIA_CHUNKS` | Fragmentos procesados para búsqueda |
| `APUNTIA_CONVERSATIONS` | Sesiones de chat del usuario |
| `APUNTIA_MESSAGES` | Mensajes individuales y respuestas |

### Paquete PL/SQL

| Procedimiento/Función | Descripción |
|----------------------|-------------|
| `process_document` | Fragmenta documentos en chunks indexables |
| `search_relevant_chunks` | Búsqueda semántica en el contenido |
| `generate_rag_response` | Genera respuestas contextuales |
| `create_conversation` | Inicia nuevas sesiones de chat |

### Páginas APEX

| Página | Funcionalidad |
|--------|---------------|
| **Dashboard** | Métricas y resumen del sistema |
| **Gestión de Documentos** | Carga y administración de archivos |
| **Chat ApuntIA** | Interfaz conversacional principal |

## 🛠️ Solución de Problemas

### Chat no responde
```sql
-- Verificar procesos AJAX
SELECT * FROM apex_application_page_proc 
WHERE application_id = 103 
AND page_id = 3 
AND process_name IN ('CREATE_CONVERSATION', 'GENERATE_RAG_RESPONSE');
```

### Sin resultados de búsqueda
```sql
-- Verificar chunks generados
SELECT COUNT(*) FROM APUNTIA_CHUNKS;
SELECT document_name, status FROM APUNTIA_DOCUMENTS;
```

### Errores de JavaScript
- Abrir consola del navegador (F12)
- Revisar la pestaña Console y Network
- Verificar llamadas AJAX exitosas

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

### Estándares de Código

- **PL/SQL**: Seguir convenciones Oracle, usar prefijos `v_` para variables
- **JavaScript**: ES6+, funciones declarativas
- **CSS**: BEM methodology para clases, mobile-first approach

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 👨‍💻 Autors
Angelica Lopez
- GitHub: https://github.com/Angie0528
- LinkedIn: https://www.linkedin.com/in/angelica-sofia-lopez-garcia-1205b532b/
- Email: aslopezgarcia@gmail.com

Víctor Velázquez 
- GitHub: https://github.com/Victor-123321
- LinkedIn: linkedin.com/in/víctor-velázquez-1677042b3
- Email: victor.velazquez2210@gmail.com

Eilyn Resendez
- GitHub: https://github.com/eilyn0208
- LinkedIn: linkedin.com/in/eilyn-resendez
- Email: a01645344@tec.mx

Diego Lizarraga
- GitHub: https://github.com/DiegoLizarraga
- LinkedIn: linkedin.com/in/diego-martin-lizarraga-sanchez-1499aa324
- Email: lizarragasanchezdiego@gmail.com

  
## 🙏 Agradecimientos

- Oracle APEX Community por la documentación y ejemplos
- Equipo de Oracle Database por las funciones de búsqueda de texto
- Comunidad open-source por las librerías de UI utilizadas

## 📊 Métricas del Proyecto

- **Líneas de código**: ~2,500 LOC
- **Tablas de BD**: 4 tablas principales
- **Páginas APEX**: 3 páginas funcionales
- **Tiempo de desarrollo**: ~40 horas
- **Última actualización**: Agosto 2025

---

⭐ **¡Si este proyecto te resulta útil, dale una estrella!** ⭐
